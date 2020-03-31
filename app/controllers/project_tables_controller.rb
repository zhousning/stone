class ProjectTablesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @project = get_project 
    @project_tables = @project.project_tables
  end
   
  def edit
    @project = get_project 
    @project_table = @project.project_tables.find(params[:id])
    @project_pages = @project_table.project_pages
  end
   

   
  def update
    @project = get_project 
    @project_table = @project.project_tables.find(params[:id])
    if @project_table.update(project_table_params)
      redirect_to edit_project_project_table_path(@project, @project_table) 
    else
      render :edit
    end
  end

  def show
    @project = get_project 
    @project_table = @project.project_tables.find(params[:id])
    @project_pages = @project_table.project_pages
  end
   

   
  def destroy
    @project = get_project 
    @project_table = @project.project_tables.find(params[:id])
    @project_table.destroy
    redirect_to project_project_tables_path(@project, @project_table) 
  end
   

  

  
    def download_append
      @project_table = ProjectTable.find(params[:id])
      @attachment = @project_table.attachment_url

      if @attachment
        send_file File.join(Rails.root, "public", URI.decode(@attachment)), :type => "application/force-download", :x_sendfile=>true
      end
    end


  private
    def project_table_params
      params.require(:project_table).permit( :category, :number, :name, :info , :attachment, project_pages_attributes: project_page_params)
    end
  
    def project_page_params
      [:id, :html, :style ,:_destroy]
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

