class DesignerStructureCertsController < ApplicationController
  include CtrlCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    index_base("DesignerStructure")
  end
   
  def new
    new_base("DesignerStructure")
  end
   

   
  def create
    create_base("DesignerStructure")
  end
   

   
  def edit
    edit_base("DesignerStructure")
  end
   

   
  def update
    update_base("DesignerStructure")
  end

   

   
  def destroy
    destroy_base("DesignerStructure")
  end


  private
    def designer_structure_cert_params
      params.require(:designer_structure_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

