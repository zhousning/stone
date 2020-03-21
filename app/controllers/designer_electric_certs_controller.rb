class DesignerElectricCertsController < ApplicationController
  include CtrlCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    index_base("DesignerElectric")
  end
   
  def new
    new_base("DesignerElectric")
  end
   

   
  def create
    create_base("DesignerElectric")
  end
   

   
  def edit
    edit_base("DesignerElectric")
  end
   

   
  def update
    update_base("DesignerElectric")
  end

   

   
  def destroy
    destroy_base("DesignerElectric")
  end


  private
    def designer_electric_cert_params
      params.require(:designer_electric_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

