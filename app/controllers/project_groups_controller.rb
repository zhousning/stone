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
    @agentors = @project_group.agentor_cos
    @monitors = @project_group.monitor_cos
  end
   

   
  def show
    @project_group = ProjectGroup.find(params[:id])
  end
   

   
  def new
    @project_group = ProjectGroup.new
    
  end
   

   
  def create
    @project_group = ProjectGroup.new(project_group_params)
    #@project_group.user = current_user
    if @project_group.save
      redirect_to @project_group
    else
      render :new
    end
  end
   

   
  def edit
    @project_group = ProjectGroup.find(params[:id])
  end
   

   
  def update
    @project_group = ProjectGroup.find(params[:id])
    if @project_group.update(project_group_params)
      redirect_to project_group_path(@project_group) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @project_group = ProjectGroup.find(params[:id])
    @project_group.destroy
    redirect_to :action => :index
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

