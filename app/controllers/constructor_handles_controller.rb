class ConstructorHandlesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @constructor = current_user.constructor
    @constructor_handles = @constructor.constructor_handles
  end
   
   
  def new
    @constructor = current_user.constructor
    @constructor_handle = ConstructorHandle.new
  end
   

   
  def create
    @constructor_handle = ConstructorHandle.new(constructor_handle_params)
    @constructor = current_user.constructor
    @constructor_handle.constructor = @constructor
    role = Role.find_by_name(Setting.roles.constructor_handle)

    phone = @constructor_handle.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@constructor, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.constructor_handle
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @constructor_handle.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @constructor_handle.user = @user
    end
    if @user.persisted? &&  @constructor_handle.save
      @constructor_handle.to_s
      save_cpt_dep_user(@constructor, @constructor_handle, @user)
      redirect_to edit_constructor_constructor_handle_path(@constructor, @constructor_handle) 
    else
      render :new
    end
  end
   

   
  def edit
    @constructor = current_user.constructor
    @constructor_handle = @constructor.constructor_handles.find(params[:id])
  end
   

   
  def update
    @constructor = current_user.constructor
    @constructor_handle = @constructor.constructor_handles.find(params[:id])
    phone = constructor_handle_params[:phone]
    handle_phone = @constructor_handle.phone
    if phone.blank?
      render :edit
      return
    end
    if @constructor_handle.update(constructor_handle_params)
      if phone != handle_phone 
        user = User.find_by_phone(handle_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_constructor_constructor_handle_path(@constructor, @constructor_handle) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @constructor = current_user.constructor
    @constructor_handle = @constructor.constructor_handles.find(params[:id])
    @user = @constructor_handle.user
    delete_cpt_dep_user(@constructor, @constructor_handle, @user)
    @constructor_handle.destroy
    redirect_to :action => :index
  end
   

  

  
  

  

  private
    def constructor_handle_params
      params.require(:constructor_handle).permit( :name, :phone, :idno, :cpt_job, :prj_job , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

