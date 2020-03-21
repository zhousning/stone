class SupervisorTargetCertsController < ApplicationController
  include CtrlCtgCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    index_base("SupervisorTarget")
  end
   
  def new
    new_base("SupervisorTarget")
  end
   

   
  def create
    create_base("SupervisorTarget")
  end
   

   
  def edit
    edit_base("SupervisorTarget")
  end
   

   
  def update
    update_base("SupervisorTarget")
  end

   

   
  def destroy
    destroy_base("SupervisorTarget")
  end

   

  private
    def supervisor_target_cert_params
      params.require(:supervisor_target_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

