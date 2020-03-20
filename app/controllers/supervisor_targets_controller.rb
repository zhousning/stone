class SupervisorTargetsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @supervisor = current_user.supervisor
    @supervisor_targets = @supervisor.supervisor_targets
  end
   
   
  def new
    @supervisor = current_user.supervisor
    @supervisor_target = SupervisorTarget.new
  end
   

   
  def create
    @supervisor_target = SupervisorTarget.new(supervisor_target_params)
    @supervisor = current_user.supervisor
    @supervisor_target.supervisor = @supervisor
    role = Role.find_by_name(Setting.roles.supervisor_target)

    phone = @supervisor_target.phone
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
      if @user.supervisor_target
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @supervisor_target.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @supervisor_target.user = @user
    end
    if @user.persisted? &&  @supervisor_target.save
      save_cpt_dep_user(@supervisor, @supervisor_target, @user)
      redirect_to edit_supervisor_supervisor_target_path(@supervisor, @supervisor_target) 
    else
      render :new
    end
  end
   

   
  def edit
    @supervisor = current_user.supervisor
    @supervisor_target = @supervisor.supervisor_targets.find(params[:id])
  end
   

   
  def update
    @supervisor = current_user.supervisor
    @supervisor_target = @supervisor.supervisor_targets.find(params[:id])
    phone = supervisor_target_params[:phone]
    target_phone = @supervisor_target.phone
    if phone.blank?
      render :edit
      return
    end
    if @supervisor_target.update(supervisor_target_params)
      if phone != target_phone 
        user = User.find_by_phone(target_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_supervisor_supervisor_target_path(@supervisor, @supervisor_target) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @supervisor = current_user.supervisor
    @supervisor_target = @supervisor.supervisor_targets.find(params[:id])
    @user = @supervisor_target.user
    delete_cpt_dep_user(@supervisor, @supervisor_target, @user)
    @supervisor_target.destroy
    redirect_to :action => :index
  end
   
  private
    def supervisor_target_params
      params.require(:supervisor_target).permit( :name, :phone, :idno, :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

