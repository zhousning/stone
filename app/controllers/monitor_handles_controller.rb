class MonitorHandlesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


   
  def index
    @monitor = current_user.monitor_co
    @monitor_handles = @monitor.monitor_handles
  end
   
   
  def new
    @monitor = current_user.monitor_co
    @monitor_handle = MonitorHandle.new
  end
   

   
  def create
    @monitor_handle = MonitorHandle.new(monitor_handle_params)
    @monitor = current_user.monitor_co
    @monitor_handle.monitor_co = @monitor
    role = Role.find_by_name(Setting.roles.monitor_handle)

    phone = @monitor_handle.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@monitor, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.monitor_co_handle
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @monitor_handle.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @monitor_handle.user = @user
    end
    if @user.persisted? &&  @monitor_handle.save
      save_cpt_dep_user(@monitor, @monitor_handle, @user)
      redirect_to edit_monitor_co_monitor_handle_path(@monitor, @monitor_handle) 
    else
      render :new
    end
  end
   

   
  def edit
    @monitor = current_user.monitor_co
    @monitor_handle = @monitor.monitor_handles.find(params[:id])
  end
   

   
  def update
    @monitor = current_user.monitor_co
    @monitor_handle = @monitor.monitor_handles.find(params[:id])
    phone = monitor_handle_params[:phone]
    handle_phone = @monitor_handle.phone
    if phone.blank?
      render :edit
      return
    end
    if @monitor_handle.update(monitor_handle_params)
      if phone != handle_phone 
        user = User.find_by_phone(handle_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_monitor_co_monitor_handle_path(@monitor, @monitor_handle) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @monitor = current_user.monitor_co
    @monitor_handle = @monitor.monitor_handles.find(params[:id])
    @user = @monitor_handle.user
    delete_cpt_dep_user(@monitor, @monitor_handle, @user)
    @monitor_handle.destroy
    redirect_to :action => :index
  end
   

  

  

   

  private
    def monitor_handle_params
      params.require(:monitor_handle).permit( :name, :phone, :idno, :cpt_job, :prj_job , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back , attachments_attributes: attachment_params)
    end
  
  
    def attachment_params
      [:id, :file, :_destroy]
    end
  
  
end

