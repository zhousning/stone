class ProjectTablesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @project_tables = ProjectTable.all
  end
   

   
  def show
    @project_table = ProjectTable.find(params[:id])
  end
   

   
  def new
    @project_table = ProjectTable.new
    
    @project_table.project_pages.build
    
  end
   

   
  def create
    @project_table = ProjectTable.new(project_table_params)
    #@project_table.user = current_user
    if @project_table.save
      redirect_to @project_table
    else
      render :new
    end
  end
   

   
  def edit
    @project_table = ProjectTable.find(params[:id])
  end
   

   
  def update
    @project_table = ProjectTable.find(params[:id])
    if @project_table.update(project_table_params)
      redirect_to project_table_path(@project_table) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @project_table = ProjectTable.find(params[:id])
    @project_table.destroy
    redirect_to :action => :index
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
      [:id, :content ,:_destroy]
    end
  
end

