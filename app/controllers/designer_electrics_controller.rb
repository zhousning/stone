class DesignerElectricsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @designer = current_user.designer
    @designer_electrics = @designer.designer_electrics
  end
   
   
  def new
    @designer = current_user.designer
    @designer_electric = DesignerElectric.new
  end
   

   
  def create
    @designer_electric = DesignerElectric.new(designer_electric_params)
    @designer = current_user.designer
    @designer_electric.designer = @designer
    role = Role.find_by_name(Setting.roles.designer_electric)

    phone = @designer_electric.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@designer, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.designer_electric
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @designer_electric.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @designer_electric.user = @user
    end
    if @user.persisted? &&  @designer_electric.save
      save_cpt_dep_user(@designer, @designer_electric, @user)
      redirect_to edit_designer_designer_electric_path(@designer, @designer_electric) 
    else
      render :new
    end
  end
   

   
  def edit
    @designer = current_user.designer
    @designer_electric = @designer.designer_electrics.find(params[:id])
  end
   

   
  def update
    @designer = current_user.designer
    @designer_electric = @designer.designer_electrics.find(params[:id])
    phone = designer_electric_params[:phone]
    electric_phone = @designer_electric.phone
    if phone.blank?
      render :edit
      return
    end
    if @designer_electric.update(designer_electric_params)
      if phone != electric_phone 
        user = User.find_by_phone(electric_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_designer_designer_electric_path(@designer, @designer_electric) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer = current_user.designer
    @designer_electric = @designer.designer_electrics.find(params[:id])
    @user = @designer_electric.user
    delete_cpt_dep_user(@designer, @designer_electric, @user)
    @designer_electric.destroy
    redirect_to :action => :index
  end
   
  private
    def designer_electric_params
      params.require(:designer_electric).permit( :name, :phone, :idno, :status, :idnumber , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

