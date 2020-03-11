class TableTemplatesController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @table_templates = TableTemplate.all
  end
   

   
  def show
    @table_template = TableTemplate.find(params[:id])
  end
   

   
  def new
    @table_template = TableTemplate.new
    
    @table_template.table_pages.build
    
  end
   

   
  def create
    @table_template = TableTemplate.new(table_template_params)
    #@table_template.user = current_user
    if @table_template.save
      redirect_to @table_template
    else
      render :new
    end
  end
   

   
  def edit
    @table_template = TableTemplate.find(params[:id])
  end
   

   
  def update
    @table_template = TableTemplate.find(params[:id])
    if @table_template.update(table_template_params)
      redirect_to table_template_path(@table_template) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @table_template = TableTemplate.find(params[:id])
    @table_template.destroy
    redirect_to :action => :index
  end
   

  

  
    def download_append
      @table_template = TableTemplate.find(params[:id])
      @attachment = @table_template.attachment_url

      if @attachment
        send_file File.join(Rails.root, "public", URI.decode(@attachment)), :type => "application/force-download", :x_sendfile=>true
      end
    end
  

  private
    def table_template_params
      params.require(:table_template).permit( :category, :number, :name, :info , :attachment, table_pages_attributes: table_page_params)
    end
  
  
  
    def table_page_params
      [:id, :content ,:_destroy]
    end
  
end

