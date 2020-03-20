class SupervisorWorkersController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @supervisor = current_user.supervisor
    @supervisor_workers = @supervisor.supervisor_workers
  end
   
   
  def new
    @supervisor = current_user.supervisor
    @supervisor_worker = SupervisorWorker.new
  end
   

   
  def create
    @supervisor_worker = SupervisorWorker.new(supervisor_worker_params)
    @supervisor = current_user.supervisor
    @supervisor_worker.supervisor = @supervisor
    role = Role.find_by_name(Setting.roles.supervisor_worker)

    phone = @supervisor_worker.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@supervisor, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.supervisor_worker
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @supervisor_worker.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @supervisor_worker.user = @user
    end
    if @user.persisted? && @supervisor_worker.save
      save_cpt_dep_user(@supervisor, @supervisor_worker, @user)
      redirect_to edit_supervisor_supervisor_worker_path(@supervisor, @supervisor_worker) 
    else
      render :new
    end
  end
   

   
  def edit
    @supervisor = current_user.supervisor
    @supervisor_worker = @supervisor.supervisor_workers.find(params[:id])
  end
   

   
  def update
    @supervisor = current_user.supervisor
    @supervisor_worker = @supervisor.supervisor_workers.find(params[:id])
    phone = supervisor_worker_params[:phone]
    worker_phone = @supervisor_worker.phone
    if phone.blank?
      render :edit
      return
    end
    if @supervisor_worker.update(supervisor_worker_params)
      if phone != worker_phone 
        user = User.find_by_phone(worker_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_supervisor_supervisor_worker_path(@supervisor, @supervisor_worker) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @supervisor = current_user.supervisor
    @supervisor_worker = @supervisor.supervisor_workers.find(params[:id])
    @user = @supervisor_worker.user
    delete_cpt_dep_user(@supervisor, @supervisor_worker, @user)
    @supervisor_worker.destroy
    redirect_to :action => :index
  end
   
  private
    def supervisor_worker_params
      params.require(:supervisor_worker).permit( :name, :phone, :idno, :status, :idnumber , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

