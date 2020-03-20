class DesignerWaterCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @designer_water_certs = DesignerWaterCert.all
  end
   

   

   
  def new
    @designer_water_cert = DesignerWaterCert.new
    
  end
   

   
  def create
    @designer_water_cert = DesignerWaterCert.new(designer_water_cert_params)
    #@designer_water_cert.user = current_user
    if @designer_water_cert.save
      redirect_to @designer_water_cert
    else
      render :new
    end
  end
   

   
  def edit
    @designer_water_cert = DesignerWaterCert.find(params[:id])
  end
   

   
  def update
    @designer_water_cert = DesignerWaterCert.find(params[:id])
    if @designer_water_cert.update(designer_water_cert_params)
      redirect_to designer_water_cert_path(@designer_water_cert) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer_water_cert = DesignerWaterCert.find(params[:id])
    @designer_water_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def designer_water_cert_params
      params.require(:designer_water_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

