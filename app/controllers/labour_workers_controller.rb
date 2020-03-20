class LabourWorkersController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @labour_workers = @labour.labour_workers
  end
   
   
  def new
    @labour_worker = LabourWorker.new
  end
   

   
  def create
    @labour_worker = LabourWorker.new(labour_worker_params)
    @labour = current_user.labour
    @labour_worker.labour = @labour
    role = Role.find_by_name(Setting.roles.labour_worker)

    phone = @labour_worker.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@labour, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.labour_worker
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @labour_worker.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @labour_worker.user = @user
    end
    if @user.persisted? &&  @labour_worker.save
      save_cpt_dep_user(@labour, @labour_worker, @user)
      redirect_to edit_labour_labour_worker_path(@labour, @labour_worker) 
    else
      render :new
    end
  end
   

   
  def edit
    @labour = current_user.labour
    @labour_worker = @labour.labour_workers.find(params[:id])
  end
   

   
  def update
    @labour = current_user.labour
    @labour_worker = @labour.labour_workers.find(params[:id])
    phone = labour_worker_params[:phone]
    worker_phone = @labour_worker.phone
    if phone.blank?
      render :edit
      return
    end
    if @labour_worker.update(labour_worker_params)
      if phone != worker_phone 
        user = User.find_by_phone(worker_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_labour_labour_worker_path(@labour, @labour_worker) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @labour_worker = @labour.labour_workers.find(params[:id])
    @user = @labour_worker.user
    delete_cpt_dep_user(@labour, @labour_worker, @user)
    @labour_worker.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def labour_worker_params
      params.require(:labour_worker).permit( :name, :phone, :idno , :idcard_front , :idcard_back , :hr_front , :hr_back , :stamp_front , :stamp_back)
    end
  
  
  
end

