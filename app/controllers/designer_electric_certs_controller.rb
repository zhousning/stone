class DesignerElectricCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    @designer_electric = DesignerElectric.find(params[:designer_electric_id])
    @designer_electric_certs = @designer_electric.designer_electric_certs
  end
   
  def new
    @designer_electric = DesignerElectric.find(params[:designer_electric_id])
    @designer_electric_cert = DesignerElectricCert.new
  end
   

   
  def create
    @designer_electric = DesignerElectric.find(params[:designer_electric_id])
    @designer_electric_cert = DesignerElectricCert.new(designer_electric_cert_params)
    @designer_electric_cert.designer_electric = @designer_electric
    if @designer_electric_cert.save
      redirect_to edit_designer_electric_designer_electric_cert_url(@designer_electric, @designer_electric_cert)
    else
      render :new
    end
  end
   

   
  def edit
    @designer_electric = DesignerElectric.find(params[:designer_electric_id])
    @designer_electric_cert = @designer_electric.designer_electric_certs.find(params[:id])
  end
   

   
  def update
    @designer_electric = DesignerElectric.find(params[:designer_electric_id])
    @designer_electric_cert = @designer_electric.designer_electric_certs.find(params[:id])

    if @designer_electric_cert.update(designer_electric_cert_params)
      redirect_to edit_designer_electric_designer_electric_cert_path(@designer_electric, @designer_electric_cert) 
    else
      render :edit
    end
  end

   

   
  def destroy
    @designer_electric = DesignerElectric.find(params[:designer_electric_id])
    @designer_electric_cert = @designer_electric.designer_electric_certs.find(params[:id])
    @designer_electric_cert.destroy
    redirect_to :action => :index
  end


  private
    def designer_electric_cert_params
      params.require(:designer_electric_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

