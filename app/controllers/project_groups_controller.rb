class ProjectGroupsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @project = get_project
    @project_group = @project.project_group 
    @labours = @project_group.labours
    @constructors = @project_group.constructors
    @supervisors = @project_group.supervisors
    @prospectors = @project_group.prospectors
    @designers = @project_group.designers
    @agentor_cos = @project_group.agentor_cos
    @monitor_cos = @project_group.monitor_cos
  end
   

   
  def show
    @project = get_project
    @project_group = @project.project_group 
    @project_group = ProjectGroup.find(params[:id])
  end
   

   
  def new
    @project = get_project
    @project_group = ProjectGroup.new 
    @my_labours = @project.project_group.labours.pluck(:id)
    @my_constructors = @project.project_group.constructors.pluck(:id)
    @my_supervisors = @project.project_group.supervisors.pluck(:id)
    @my_prospectors = @project.project_group.prospectors.pluck(:id)
    @my_designers = @project.project_group.designers.pluck(:id)
    @my_monitor_cos = @project.project_group.monitor_cos.pluck(:id)
    @my_agentor_cos = @project.project_group.agentor_cos.pluck(:id)

    #TODO修改查询为审核通过的单位
    @labours = Labour.where.not(id: @my_labours)
    @constructors = Constructor.where.not(id: @my_constructors)
    @supervisors = Supervisor.where.not(id: @my_supervisors) 
    @prospectors = Prospector.where.not(id: @my_prospectors)
    @designers = Designer.where.not(id: @my_designers)
    @monitor_cos = MonitorCo.where.not(id: @my_monitor_cos)
    @agentor_cos = AgentorCo.where.not(id: @my_agentor_cos)
  end
   
  def create
    @project = get_project
    @project_group = @project.project_group 

    @labours = Labour.find(params[:labours] || [])
    @labours.each do |labour|
      GroupLabour.create(:project_group => @project_group, :labour => labour, :status => Setting.project_groups.status_pending)
    end

    @constructors = Constructor.find(params[:constructors] || [])
    @constructors.each do |constructor|
      GroupConstructor.create(:project_group => @project_group, :constructor => constructor, :status => Setting.project_groups.status_pending)
    end

    @supervisors = Supervisor.find(params[:supervisors] || [])
    @supervisors.each do |supervisor|
      GroupSupervisor.create(:project_group => @project_group, :supervisor => supervisor, :status => Setting.project_groups.status_pending)
    end

    @prospectors = Prospector.find(params[:prospectors] || [])
    @prospectors.each do |prospector|
      GroupProspector.create(:project_group => @project_group, :prospector => prospector, :status => Setting.project_groups.status_pending)
    end

    @designers = Designer.find(params[:designers] || [])
    @designers.each do |designer|
      GroupDesigner.create(:project_group => @project_group, :designer => designer, :status => Setting.project_groups.status_pending)
    end

    @agentor_cos = AgentorCo.find(params[:agentor_cos] || [])
    @agentor_cos.each do |agentor_co|
      GroupAgentorCo.create(:project_group => @project_group, :agentor_co => agentor_co, :status => Setting.project_groups.status_pending)
    end

    @monitor_cos = MonitorCo.find(params[:monitor_cos] || [])
    @monitor_cos.each do |monitor_co|
      GroupMonitorCo.create(:project_group => @project_group, :monitor_co => monitor_co, :status => Setting.project_groups.status_pending)
    end

    redirect_to project_project_groups_url(@project)
  end
   
  def edit
    @project = get_project
    @project_group = @project.project_group 
  end
   
  def update
    @project = get_project
    @project_group = @project.project_group 
    if @project_group.update(project_group_params)
      redirect_to project_group_path(@project_group) 
    else
      render :edit
    end
  end

  def invite 
    @user = CptDepUser.find_by_user_id(current_user.id)
    clazz = @user.cpt_id.split("+")[0]

    eval("
          @#{clazz.underscore} = #{clazz}.find_by_idnumber(@user.cpt_id)\n
          @group_ships = Group#{clazz}.where(:#{clazz.underscore}_id => @#{clazz.underscore}.id, :status => Setting.project_groups.status_pending)
         ")
  end

  def agree
    @user = CptDepUser.find_by_user_id(current_user.id)
    clazz = @user.cpt_id.split("+")[0]

    eval("
          @group_ship = Group#{clazz}.find(params[:id])
         ")
    @group_ship.agree
    @project_group = @group_ship.project_group
    ProjectGroupUser.create(:project_group => @project_group, :cpt_dep_user => @user)
    redirect_to projects_path
  end
   
  def refuse 
    @user = CptDepUser.find_by_user_id(current_user.id)
    clazz = @user.cpt_id.split("+")[0]

    eval("
          @group_ship = Group#{clazz}.find(params[:id])
         ")
    @group_ship.reject
    redirect_to invite_project_groups_path
  end
  
  private
    def project_group_params
      params.require(:project_group).permit( :name, :status, :idnumber)
    end
  
    def get_project
      @user = CptDepUser.find_by_user_id(current_user.id)
      project_groups = @user.project_groups
      project = nil
      project_groups.each do |p|
        project = p.project if p.project.id == params[:project_id].to_i
      end
      project
    end
  
end

