class SupervisorStateCertsController < ApplicationController
  include CtrlCtgCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

  def index
    index_base("SupervisorState")
  end
   
  def new
    new_base("SupervisorState")
  end
   

   
  def create
    create_base("SupervisorState")
  end
   

   
  def edit
    edit_base("SupervisorState")
  end
   

   
  def update
    update_base("SupervisorState")
  end

   

   
  def destroy
    destroy_base("SupervisorState")
  end


  private
    def supervisor_state_cert_params
      params.require(:supervisor_state_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

