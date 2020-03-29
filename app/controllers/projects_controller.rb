class ProjectsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @user = CptDepUser.find_by_user_id(current_user.id)
    @groups = @user.project_groups
    @projects = []
    @groups.each do |g|
      @projects << g.project
    end
  end
   

   
  def show
    @project = get_project
  end
   

   
  def new
    @project = Project.new
  end
   

   
  def create
    @user = CptDepUser.find_by_user_id(current_user.id)
    @project = Project.new(project_params)
    @project.build_project_group(:name => @project.name + "项目组")
    if @project.save
      @project_group = @project.project_group
      @project_group.cpt_dep_users << @user
      clazz = @user.cpt_id.split("+")[0]

      eval("
            @#{clazz.downcase} = #{clazz}.find_by_idnumber(@user.cpt_id)\n
            @project_group.#{clazz.downcase.pluralize} << @#{clazz.downcase}
           ")

      redirect_to edit_project_path(@project)
    else
      render :new
    end
  end
   
   
  def edit
    @project = get_project
  end
   

   
  def update
    @project = get_project
    if @project.update(project_params)
      redirect_to edit_project_path(@project)
    else
      render :edit
    end
  end
   

   
  def destroy
    @project = get_project
    @project.destroy
    redirect_to :action => :index
  end

  def project_table
    @project = get_project
    @table_templates = TableTemplate.all

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
    @project = get_project

    begin
      ids = params[:data]
      table_tmpts = TableTemplate.find(ids.split(","))
      #TODO这个地方需要改成事务
      table_tmpts.each do |tmpt|
        @prj_table = ProjectTable.create(:category => tmpt.category, :number => tmpt.number, :name => tmpt.name, :info => tmpt.info, :project => @project, :attachment => tmpt.attachment)
        pages = tmpt.table_pages
        pages.each do |page|
          ProjectPage.create(:style => page.style, :html => page.html, :project_table => @prj_table) 
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

    def get_project
      @user = CptDepUser.find_by_user_id(current_user.id)
      project_groups = @user.project_groups
      project = nil
      project_groups.each do |p|
        project = p.project if p.project.id == params[:id].to_i
      end
      project
    end
end

