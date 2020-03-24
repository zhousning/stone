class ProjectsController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @projects = @labour.projects 
  end
   

   
  def show
    @labour = current_user.labour
    @project = @labour.projects.find(params[:id])
  end
   

   
  def new
    @labour = current_user.labour

    @project = Project.new
    
    @project.project_tables.build
    
  end
   

   
  def create
    @labour = current_user.labour
    @project = Project.new(project_params)
    @project.labour = @labour
    if @project.save
      redirect_to edit_labour_project_path(@labour, @project)
    else
      render :new
    end
  end
   

   
  def edit
    @labour = current_user.labour
    @project = @labour.projects.find(params[:id])
  end
   

   
  def update
    @labour = current_user.labour
    @project = @labour.projects.find(params[:id])
    if @project.update(project_params)
      redirect_to edit_labour_project_path(@labour, @project)
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @project = @labour.projects.find(params[:id])
    @project.destroy
    redirect_to :action => :index
  end

  def project_table
    @labour = current_user.labour
    @project = @labour.projects.find(params[:id])
    @prj_tables = @project.project_tables
    numbers = @prj_tables.select('number')
    number_arr = []
    numbers.each do |n|
      number_arr << n.number
    end

    @table_templates = TableTemplate.all.reject do |t|
      number_arr.include?(t.number)
    end

    start = @table_templates.first.category
    cache_arr = []
    groupArr = []
    @table_templates.each do |item|
      if start == item.category
        cache_arr << {"value" => item.id.to_s, "name" => item.number + item.name}
      else
        start = item.category
        cache_arr = []
        cache_arr << {"value" => item.id.to_s, "name" => item.number + item.name}
        groupArr << {"groupName" => start, "groupData" => cache_arr}
      end
    end
    hash = Hash.new
    hash["tables"] = groupArr
    gon.tables = hash
    gon.project = @project.id
  end

  def create_my_table
    @labour = current_user.labour
    @project = @labour.projects.find(params[:id])

    begin
      ids = params[:data]
      table_tmpts = TableTemplate.find(ids.split(","))
      table_tmpts.each do |tmpt|
        @prj_table = ProjectTable.create(:category => tmpt.category, :number => tmpt.number, :name => tmpt.name, :info => tmpt.info, :project => @project, :attachment => tmpt.attachment)
        pages = tmpt.table_pages
        pages.each do |page|
          ProjectPage.create(:content => page.content, :project_table => @prj_table) 
        end
      end
      respond_to do |f|
        f.json { render :json => {:status => "success"}.to_json }
      end
    rescue
      respond_to do |f|
        f.json { render :json => {:status => "error"}.to_json }
      end
    end
  end
  
  

  private
    def project_params
      params.require(:project).permit( :name, :itemname, :dep_prj, :cstr, :carry, :survey, :design, :control, :detect, :monitor, :domain, :major, :agent, :plan_permit, :carry_permit, :monitor_permit, :cstr_agent, :receive_leader, :receive_operator, :general_supervisor, :prfs_supervisor, :supervisor, :supervising_engineer, :technical_director, :project_manager, :subctr_manager, :cstr_foreman, :constructors, :quality_worker, :inspector, :test_person, :detect_person, :auditor, :reviewer, :tester, :issuer, :examiner, :calculator, :recorder, :surveyor, :filler, :operator, :equipment, :address, :structor, :layer_number, :prj_category, :prj_scale, :start, :end, :review_unit, :review_permission, :measure_cert, :supervision_no, :quality_info, :regist_no, :prj_designer, :geo_prospect, :prj_manager, project_tables_attributes: project_table_params)
    end
  
  
  
    def project_table_params
      [:id, :category, :number, :name, :info ,:_destroy]
    end
  
end

