class ProspectorHandlesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @prospector = current_user.prospector
    @prospector_handles = @prospector.prospector_handles
  end
   
   
  def new
    @prospector_handle = ProspectorHandle.new
  end
   

   
  def create
    @prospector_handle = ProspectorHandle.new(prospector_handle_params)
    @prospector = current_user.prospector
    @prospector_handle.prospector = @prospector
    role = Role.find_by_name(Setting.roles.prospector_handle)

    phone = @prospector_handle.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@prospector, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.prospector_handle
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @prospector_handle.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @prospector_handle.user = @user
    end
    if @prospector_handle.save
      save_cpt_dep_user(@prospector, @prospector_handle, @user)
      redirect_to edit_prospector_prospector_handle_path(@prospector, @prospector_handle) 
    else
      render :new
    end
  end
   

   
  def edit
    @prospector = current_user.prospector
    @prospector_handle = @prospector.prospector_handles.find(params[:id])
  end
   

   
  def update
    @prospector = current_user.prospector
    @prospector_handle = @prospector.prospector_handles.find(params[:id])
    phone = prospector_handle_params[:phone]
    handle_phone = @prospector_handle.phone
    if phone.blank?
      render :edit
      return
    end
    if @prospector_handle.update(prospector_handle_params)
      if phone != handle_phone 
        user = User.find_by_phone(handle_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_prospector_prospector_handle_path(@prospector, @prospector_handle) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @prospector = current_user.prospector
    @prospector_handle = @prospector.prospector_handles.find(params[:id])
    @user = @prospector_handle.user
    delete_cpt_dep_user(@prospector, @prospector_handle, @user)
    @prospector_handle.destroy
    redirect_to :action => :index
  end
   


  private
    def prospector_handle_params
      params.require(:prospector_handle).permit( :name, :phone, :idno, :cpt_job, :prj_job , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

