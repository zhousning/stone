class DesignerWarmCertsController < ApplicationController
  include CtrlCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource



  def index
    index_base("DesignerWarm")
  end
   
  def new
    new_base("DesignerWarm")
  end
   

   
  def create
    create_base("DesignerWarm")
  end
   

   
  def edit
    edit_base("DesignerWarm")
  end
   

   
  def update
    update_base("DesignerWarm")
  end

   

   
  def destroy
    destroy_base("DesignerWarm")
  end


  private
    def designer_warm_cert_params
      params.require(:designer_warm_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

