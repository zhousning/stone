class ProjectsController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @projects = Project.all
  end
   

   
  def show
    @project = Project.find(params[:id])
  end
   

   
  def new
    @project = Project.new
    
    @project.project_tables.build
    
  end
   

   
  def create
    @project = Project.new(project_params)
    #@project.user = current_user
    if @project.save
      redirect_to @project
    else
      render :new
    end
  end
   

   
  def edit
    @project = Project.find(params[:id])
  end
   

   
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to project_path(@project) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def project_params
      params.require(:project).permit( :name, :itemname, :dep_prj, :cstr, :carry, :survey, :design, :control, :detect, :monitor, :domain, :major, :agent, :plan_permit, :carry_permit, :monitor_permit, :cstr_agent, :receive_leader, :receive_operator, :general_supervisor, :prfs_supervisor, :supervisor, :supervising_engineer, :technical_director, :project_manager, :subctr_manager, :cstr_foreman, :constructors, :quality_worker, :inspector, :test_person, :detect_person, :auditor, :reviewer, :tester, :issuer, :examiner, :calculator, :recorder, :surveyor, :filler, :operator, :equipment, :address, :structor, :layer_number, :prj_category, :prj_scale, :start, :end, :review_unit, :review_permission, :measure_cert, :supervision_no, :quality_info, :regist_no, :prj_designer, :geo_prospect, :prj_manager, :status, project_tables_attributes: project_table_params)
    end
  
  
  
    def project_table_params
      [:id, :category, :number, :name, :info ,:_destroy]
    end
  
end

