class TableTemplatesController < ApplicationController
  layout "application_ckeditor_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @table_templates = current_user.table_templates
  end
   

   
  def show
    @table_template = current_user.table_templates.find(params[:id])
  end
   

   
  def new
    @table_template = TableTemplate.new
    
    #@table_template.table_pages.build
  end
   

   
  def create
    @table_template = TableTemplate.new(table_template_params)
    @table_template.user = current_user
    if @table_template.save
      redirect_to edit_table_template_path(@table_template) 
    else
      render :new
    end
  end
   

   
  def edit
    @table_template = current_user.table_templates.find(params[:id])
  end
   

  def content
    @table_template = current_user.table_templates.find(params[:id])
  end

  def update_content
    @table_template = current_user.table_templates.find(params[:id])
    if @table_template.update(table_template_params)
      redirect_to content_table_template_path(@table_template) 
    else
      render :content
    end
  end
   
  def update
    @table_template = current_user.table_templates.find(params[:id])
    if @table_template.update(table_template_params)
      redirect_to edit_table_template_path(@table_template) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @table_template = current_user.table_templates.find(params[:id])
    @table_template.destroy
    redirect_to :action => :index
  end
   

  def change_status 
    @table_template = current_user.table_templates.find(params[:id])
    if @table_template
      state = params[:data]
      if state == '0'
        @table_template.state_private
      elsif state == '1'
        @table_template.state_public
      end
      respond_to do |f|
        f.json { render :json => {:status => "success"}.to_json }
      end
    else
      respond_to do |f|
        f.json { render :json => {:status => "no authority"}.to_json }
      end
    end
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
      params.require(:table_template).permit( :category, :number, :name, :info , :content, :attachment, table_pages_attributes: table_page_params)
    end
  
  
  
    def table_page_params
      [:id, :html, :style ,:_destroy]
    end
  
end

