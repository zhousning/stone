class ProjectTablesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @project = @labour.projects.find(params[:project_id])
    @project_tables = @project.project_tables
  end
   
  def edit
    @labour = current_user.labour
    @project = @labour.projects.find(params[:project_id])
    @project_table = @project.project_tables.find(params[:id])
    @project_pages = @project_table.project_pages
  end
   

   
  def update
    @labour = current_user.labour
    @project = @labour.projects.find(params[:project_id])
    @project_table = @project.project_tables.find(params[:id])
    if @project_table.update(project_table_params)
      redirect_to edit_project_project_table_path(@project, @project_table) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @project = @labour.projects.find(params[:project_id])
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
  
end

