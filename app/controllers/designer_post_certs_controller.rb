class DesignerPostCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    @designer_post = DesignerPost.find(params[:designer_post_id])
    @designer_post_certs = @designer_post.designer_post_certs
  end
   
  def new
    @designer_post = DesignerPost.find(params[:designer_post_id])
    @designer_post_cert = DesignerPostCert.new
  end
   

   
  def create
    @designer_post = DesignerPost.find(params[:designer_post_id])
    @designer_post_cert = DesignerPostCert.new(designer_post_cert_params)
    @designer_post_cert.designer_post = @designer_post
    if @designer_post_cert.save
      redirect_to edit_designer_post_designer_post_cert_url(@designer_post, @designer_post_cert)
    else
      render :new
    end
  end
   

   
  def edit
    @designer_post = DesignerPost.find(params[:designer_post_id])
    @designer_post_cert = @designer_post.designer_post_certs.find(params[:id])
  end
   

   
  def update
    @designer_post = DesignerPost.find(params[:designer_post_id])
    @designer_post_cert = @designer_post.designer_post_certs.find(params[:id])

    if @designer_post_cert.update(designer_post_cert_params)
      redirect_to edit_designer_post_designer_post_cert_path(@designer_post, @designer_post_cert) 
    else
      render :edit
    end
  end

   

   
  def destroy
    @designer_post = DesignerPost.find(params[:designer_post_id])
    @designer_post_cert = @designer_post.designer_post_certs.find(params[:id])
    @designer_post_cert.destroy
    redirect_to :action => :index
  end


  

  private
    def designer_post_cert_params
      params.require(:designer_post_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

