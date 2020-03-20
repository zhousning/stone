class DesignerStructureCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource
  
  def index
    @designer_structure = DesignerStructure.find(params[:designer_structure_id])
    @designer_structure_certs = @designer_structure.designer_structure_certs
  end
   
  def new
    @designer_structure = DesignerStructure.find(params[:designer_structure_id])
    @designer_structure_cert = DesignerStructureCert.new
  end
   

   
  def create
    @designer_structure = DesignerStructure.find(params[:designer_structure_id])
    @designer_structure_cert = DesignerStructureCert.new(designer_structure_cert_params)
    @designer_structure_cert.designer_structure = @designer_structure
    if @designer_structure_cert.save
      redirect_to edit_designer_structure_designer_structure_cert_url(@designer_structure, @designer_structure_cert)
    else
      render :new
    end
  end
   

   
  def edit
    @designer_structure = DesignerStructure.find(params[:designer_structure_id])
    @designer_structure_cert = @designer_structure.designer_structure_certs.find(params[:id])
  end
   

   
  def update
    @designer_structure = DesignerStructure.find(params[:designer_structure_id])
    @designer_structure_cert = @designer_structure.designer_structure_certs.find(params[:id])

    if @designer_structure_cert.update(designer_structure_cert_params)
      redirect_to edit_designer_structure_designer_structure_cert_path(@designer_structure, @designer_structure_cert) 
    else
      render :edit
    end
  end

   

   
  def destroy
    @designer_structure = DesignerStructure.find(params[:designer_structure_id])
    @designer_structure_cert = @designer_structure.designer_structure_certs.find(params[:id])
    @designer_structure_cert.destroy
    redirect_to :action => :index
  end
  

  private
    def designer_structure_cert_params
      params.require(:designer_structure_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

