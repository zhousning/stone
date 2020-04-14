class ProjectsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @user = CptDepUser.find_by_user_id(current_user.id)
    clazz = @user.cpt_id.split("+")[0]
    eval("
          @#{clazz.underscore} = #{clazz}.find_by_idnumber(@user.cpt_id)\n
          @groups = Group#{clazz}.where(:#{clazz.underscore} => @#{clazz.underscore}, :status => Setting.project_groups.status_join)
         ")
    @projects = []
    @groups.each do |g|
      @projects << g.project_group.project
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
    @project.creator = current_user.id
    @project.build_project_group(:name => @project.name + "项目组", :creator => current_user.id)
    if @project.save
      @project_group = @project.project_group
      @project_group.cpt_dep_users << @user
      clazz = @user.cpt_id.split("+")[0]

      eval("
            @#{clazz.underscore} = #{clazz}.find_by_idnumber(@user.cpt_id)\n
            Group#{clazz}.create(:project_group => @project_group, :#{clazz.underscore} => @#{clazz.underscore}, :status => Setting.project_groups.status_join)
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
    @table_templates = TableTemplate.where(:status => Setting.systems.status_public)

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
      puts ids
      table_tmpts = TableTemplate.find(ids.split(","))
      prj_tables = []
      table_tmpts.each do |tmpt|
        prj_tables << ProjectTable.new(:category => tmpt.category, :number => tmpt.number, :name => tmpt.name, :info => tmpt.info, :project => @project, :content => tmpt.content, :creator => current_user.id)
      end
      ProjectTable.import prj_tables
      respond_to do |f|
        f.json { render :json => {:status => "success"}.to_json }
      end
    rescue  Exception => e
      puts e
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

