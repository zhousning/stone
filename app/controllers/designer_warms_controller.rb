class DesignerWarmsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @designer = current_user.designer
    @designer_warms = @designer.designer_warms
  end
   
   
  def new
    @designer = current_user.designer
    @designer_warm = DesignerWarm.new
  end
   

   
  def create
    @designer_warm = DesignerWarm.new(designer_warm_params)
    @designer = current_user.designer
    @designer_warm.designer = @designer
    role = Role.find_by_name(Setting.roles.designer_warm)

    phone = @designer_warm.phone
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
      if @user.designer_warm
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @designer_warm.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @designer_warm.user = @user
    end
    if @user.persisted? &&  @designer_warm.save
      save_cpt_dep_user(@designer, @designer_warm, @user)
      redirect_to edit_designer_designer_warm_path(@designer, @designer_warm) 
    else
      render :new
    end
  end
   

   
  def edit
    @designer = current_user.designer
    @designer_warm = @designer.designer_warms.find(params[:id])
  end
   

   
  def update
    @designer = current_user.designer
    @designer_warm = @designer.designer_warms.find(params[:id])
    phone = designer_warm_params[:phone]
    warm_phone = @designer_warm.phone
    if phone.blank?
      render :edit
      return
    end
    if @designer_warm.update(designer_warm_params)
      if phone != warm_phone 
        user = User.find_by_phone(warm_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_designer_designer_warm_path(@designer, @designer_warm) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer = current_user.designer
    @designer_warm = @designer.designer_warms.find(params[:id])
    @user = @designer_warm.user
    delete_cpt_dep_user(@designer, @designer_warm, @user)
    @designer_warm.destroy
    redirect_to :action => :index
  end

  private
    def designer_warm_params
      params.require(:designer_warm).permit( :name, :phone, :idno, :status, :idnumber , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

