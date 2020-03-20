class DesignerConstructorCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @designer_constructor_certs = DesignerConstructorCert.all
  end
   

   

   
  def new
    @designer_constructor_cert = DesignerConstructorCert.new
    
  end
   

   
  def create
    @designer_constructor_cert = DesignerConstructorCert.new(designer_constructor_cert_params)
    #@designer_constructor_cert.user = current_user
    if @designer_constructor_cert.save
      redirect_to @designer_constructor_cert
    else
      render :new
    end
  end
   

   
  def edit
    @designer_constructor_cert = DesignerConstructorCert.find(params[:id])
  end
   

   
  def update
    @designer_constructor_cert = DesignerConstructorCert.find(params[:id])
    if @designer_constructor_cert.update(designer_constructor_cert_params)
      redirect_to designer_constructor_cert_path(@designer_constructor_cert) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer_constructor_cert = DesignerConstructorCert.find(params[:id])
    @designer_constructor_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def designer_constructor_cert_params
      params.require(:designer_constructor_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

