class DesignerWarmCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    @designer_warm = DesignerWarm.find(params[:designer_warm_id])
    @designer_warm_certs = @designer_warm.designer_warm_certs
  end
   
  def new
    @designer_warm = DesignerWarm.find(params[:designer_warm_id])
    @designer_warm_cert = DesignerWarmCert.new
  end
   

   
  def create
    @designer_warm = DesignerWarm.find(params[:designer_warm_id])
    @designer_warm_cert = DesignerWarmCert.new(designer_warm_cert_params)
    @designer_warm_cert.designer_warm = @designer_warm
    if @designer_warm_cert.save
      redirect_to edit_designer_warm_designer_warm_cert_url(@designer_warm, @designer_warm_cert)
    else
      render :new
    end
  end
   

   
  def edit
    @designer_warm = DesignerWarm.find(params[:designer_warm_id])
    @designer_warm_cert = @designer_warm.designer_warm_certs.find(params[:id])
  end
   

   
  def update
    @designer_warm = DesignerWarm.find(params[:designer_warm_id])
    @designer_warm_cert = @designer_warm.designer_warm_certs.find(params[:id])

    if @designer_warm_cert.update(designer_warm_cert_params)
      redirect_to edit_designer_warm_designer_warm_cert_path(@designer_warm, @designer_warm_cert) 
    else
      render :edit
    end
  end

   

   
  def destroy
    @designer_warm = DesignerWarm.find(params[:designer_warm_id])
    @designer_warm_cert = @designer_warm.designer_warm_certs.find(params[:id])
    @designer_warm_cert.destroy
    redirect_to :action => :index
  end
  

  private
    def designer_warm_cert_params
      params.require(:designer_warm_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

