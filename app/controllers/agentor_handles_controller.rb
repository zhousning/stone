class AgentorHandlesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @agentor = current_user.agentor_co
    @agentor_handles = @agentor.agentor_handles
  end
   
   
  def new
    @agentor = current_user.agentor_co
    @agentor_handle = AgentorHandle.new
  end
   

   
  def create
    @agentor_handle = AgentorHandle.new(agentor_handle_params)
    @agentor = current_user.agentor_co
    @agentor_handle.agentor_co = @agentor
    role = Role.find_by_name(Setting.roles.agentor_handle)

    phone = @agentor_handle.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@agentor, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.agentor_co_handle
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @agentor_handle.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @agentor_handle.user = @user
    end
    if @user.persisted? &&  @agentor_handle.save
      save_cpt_dep_user(@agentor, @agentor_handle, @user)
      redirect_to edit_agentor_co_agentor_handle_path(@agentor, @agentor_handle) 
    else
      render :new
    end
  end
   

   
  def edit
    @agentor = current_user.agentor_co
    @agentor_handle = @agentor.agentor_handles.find(params[:id])
  end
   

   
  def update
    @agentor = current_user.agentor_co
    @agentor_handle = @agentor.agentor_handles.find(params[:id])
    phone = agentor_handle_params[:phone]
    handle_phone = @agentor_handle.phone
    if phone.blank?
      render :edit
      return
    end
    if @agentor_handle.update(agentor_handle_params)
      if phone != handle_phone 
        user = User.find_by_phone(handle_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_agentor_co_agentor_handle_path(@agentor, @agentor_handle) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @agentor = current_user.agentor_co
    @agentor_handle = @agentor.agentor_handles.find(params[:id])
    @user = @agentor_handle.user
    delete_cpt_dep_user(@agentor, @agentor_handle, @user)
    @agentor_handle.destroy
    redirect_to :action => :index
  end
   

  

  

  

  private
    def agentor_handle_params
      params.require(:agentor_handle).permit( :name,:phone, :idno, :cpt_job, :prj_job , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back )
    end
  
  
end

