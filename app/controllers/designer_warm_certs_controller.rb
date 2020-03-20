class DesignerWarmCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @designer_warm_certs = DesignerWarmCert.all
  end
   

   

   
  def new
    @designer_warm_cert = DesignerWarmCert.new
    
  end
   

   
  def create
    @designer_warm_cert = DesignerWarmCert.new(designer_warm_cert_params)
    #@designer_warm_cert.user = current_user
    if @designer_warm_cert.save
      redirect_to @designer_warm_cert
    else
      render :new
    end
  end
   

   
  def edit
    @designer_warm_cert = DesignerWarmCert.find(params[:id])
  end
   

   
  def update
    @designer_warm_cert = DesignerWarmCert.find(params[:id])
    if @designer_warm_cert.update(designer_warm_cert_params)
      redirect_to designer_warm_cert_path(@designer_warm_cert) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer_warm_cert = DesignerWarmCert.find(params[:id])
    @designer_warm_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def designer_warm_cert_params
      params.require(:designer_warm_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

