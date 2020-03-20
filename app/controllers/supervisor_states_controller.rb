class SupervisorStatesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @supervisor = current_user.supervisor
    @supervisor_states = @supervisor.supervisor_states
  end
   
   
  def new
    @supervisor = current_user.supervisor
    @supervisor_state = SupervisorState.new
  end
   

   
  def create
    @supervisor_state = SupervisorState.new(supervisor_state_params)
    @supervisor = current_user.supervisor
    @supervisor_state.supervisor = @supervisor
    role = Role.find_by_name(Setting.roles.supervisor_state)

    phone = @supervisor_state.phone
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
      if @user.supervisor_state
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @supervisor_state.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @supervisor_state.user = @user
    end
    if @user.persisted? && @supervisor_state.save
      save_cpt_dep_user(@supervisor, @supervisor_state, @user)
      redirect_to edit_supervisor_supervisor_state_path(@supervisor, @supervisor_state) 
    else
      render :new
    end
  end
   

   
  def edit
    @supervisor = current_user.supervisor
    @supervisor_state = @supervisor.supervisor_states.find(params[:id])
  end
   

   
  def update
    @supervisor = current_user.supervisor
    @supervisor_state = @supervisor.supervisor_states.find(params[:id])
    phone = supervisor_state_params[:phone]
    state_phone = @supervisor_state.phone
    if phone.blank?
      render :edit
      return
    end
    if @supervisor_state.update(supervisor_state_params)
      if phone != state_phone 
        user = User.find_by_phone(state_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_supervisor_supervisor_state_path(@supervisor, @supervisor_state) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @supervisor = current_user.supervisor
    @supervisor_state = @supervisor.supervisor_states.find(params[:id])
    @user = @supervisor_state.user
    delete_cpt_dep_user(@supervisor, @supervisor_state, @user)
    @supervisor_state.destroy
    redirect_to :action => :index
  end
   

  private
    def supervisor_state_params
      params.require(:supervisor_state).permit( :name, :phone, :idno , :idcard_front, :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

