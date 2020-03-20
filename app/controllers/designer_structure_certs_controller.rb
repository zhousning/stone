class DesignerStructureCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @designer_structure_certs = DesignerStructureCert.all
  end
   

   

   
  def new
    @designer_structure_cert = DesignerStructureCert.new
    
  end
   

   
  def create
    @designer_structure_cert = DesignerStructureCert.new(designer_structure_cert_params)
    #@designer_structure_cert.user = current_user
    if @designer_structure_cert.save
      redirect_to @designer_structure_cert
    else
      render :new
    end
  end
   

   
  def edit
    @designer_structure_cert = DesignerStructureCert.find(params[:id])
  end
   

   
  def update
    @designer_structure_cert = DesignerStructureCert.find(params[:id])
    if @designer_structure_cert.update(designer_structure_cert_params)
      redirect_to designer_structure_cert_path(@designer_structure_cert) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer_structure_cert = DesignerStructureCert.find(params[:id])
    @designer_structure_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def designer_structure_cert_params
      params.require(:designer_structure_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

