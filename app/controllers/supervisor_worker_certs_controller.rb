class SupervisorWorkerCertsController < ApplicationController
  include CtrlCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

  def index
    index_base("SupervisorWorker")
  end
   
  def new
    new_base("SupervisorWorker")
  end
   

   
  def create
    create_base("SupervisorWorker")
  end
   

   
  def edit
    edit_base("SupervisorWorker")
  end
   

   
  def update
    update_base("SupervisorWorker")
  end

   

   
  def destroy
    destroy_base("SupervisorWorker")
  end

   

  private
    def supervisor_worker_cert_params
      params.require(:supervisor_worker_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

