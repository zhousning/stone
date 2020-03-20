class DesignerConstructorsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @designer = current_user.designer
    @designer_constructors = @designer.designer_constructors
  end
   
   
  def new
    @designer = current_user.designer
    @designer_constructor = DesignerConstructor.new
  end
   

   
  def create
    @designer_constructor = DesignerConstructor.new(designer_constructor_params)
    @designer = current_user.designer
    @designer_constructor.designer = @designer
    role = Role.find_by_name(Setting.roles.designer_constructor)

    phone = @designer_constructor.phone
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
      if @user.designer_constructor
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @designer_constructor.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @designer_constructor.user = @user
    end
    if @user.persisted? &&  @designer_constructor.save
      save_cpt_dep_user(@designer, @designer_constructor, @user)
      redirect_to edit_designer_designer_constructor_path(@designer, @designer_constructor) 
    else
      render :new
    end
  end
   

   
  def edit
    @designer = current_user.designer
    @designer_constructor = @designer.designer_constructors.find(params[:id])
  end
   

   
  def update
    @designer = current_user.designer
    @designer_constructor = @designer.designer_constructors.find(params[:id])
    phone = designer_constructor_params[:phone]
    constructor_phone = @designer_constructor.phone
    if phone.blank?
      render :edit
      return
    end
    if @designer_constructor.update(designer_constructor_params)
      if phone != constructor_phone 
        user = User.find_by_phone(constructor_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_designer_designer_constructor_path(@designer, @designer_constructor) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer = current_user.designer
    @designer_constructor = @designer.designer_constructors.find(params[:id])
    @user = @designer_constructor.user
    delete_cpt_dep_user(@designer, @designer_constructor, @user)
    @designer_constructor.destroy
    redirect_to :action => :index
  end
   

  private
    def designer_constructor_params
      params.require(:designer_constructor).permit( :name, :phone, :idno, :status, :idnumber , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

