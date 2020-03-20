class DesignerWatersController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @designer = current_user.designer
    @designer_waters = @designer.designer_waters
  end
   
   
  def new
    @designer = current_user.designer
    @designer_water = DesignerWater.new
  end
   

   
  def create
    @designer_water = DesignerWater.new(designer_water_params)
    @designer = current_user.designer
    @designer_water.designer = @designer
    role = Role.find_by_name(Setting.roles.designer_water)

    phone = @designer_water.phone
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
      if @user.designer_water
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @designer_water.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @designer_water.user = @user
    end
    if @user.persisted? &&  @designer_water.save
      save_cpt_dep_user(@designer, @designer_water, @user)
      redirect_to edit_designer_designer_water_path(@designer, @designer_water) 
    else
      render :new
    end
  end
   

   
  def edit
    @designer = current_user.designer
    @designer_water = @designer.designer_waters.find(params[:id])
  end
   

   
  def update
    @designer = current_user.designer
    @designer_water = @designer.designer_waters.find(params[:id])
    phone = designer_water_params[:phone]
    water_phone = @designer_water.phone
    if phone.blank?
      render :edit
      return
    end
    if @designer_water.update(designer_water_params)
      if phone != water_phone 
        user = User.find_by_phone(water_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_designer_designer_water_path(@designer, @designer_water) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer = current_user.designer
    @designer_water = @designer.designer_waters.find(params[:id])
    @user = @designer_water.user
    delete_cpt_dep_user(@designer, @designer_water, @user)
    @designer_water.destroy
    redirect_to :action => :index
  end
  

  private
    def designer_water_params
      params.require(:designer_water).permit( :name, :phone, :idno, :status, :idnumber , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

