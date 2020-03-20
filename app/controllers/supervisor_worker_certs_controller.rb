class SupervisorWorkerCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    @supervisor_worker = SupervisorWorker.find(params[:supervisor_worker_id])
    @supervisor_worker_certs = @supervisor_worker.supervisor_worker_certs
  end
   
  def new
    @supervisor_worker = SupervisorWorker.find(params[:supervisor_worker_id])
    @supervisor_worker_cert = SupervisorWorkerCert.new
  end
   

   
  def create
    @supervisor_worker = SupervisorWorker.find(params[:supervisor_worker_id])
    @supervisor_worker_cert = SupervisorWorkerCert.new(supervisor_worker_cert_params)
    @supervisor_worker_cert.supervisor_worker = @supervisor_worker
    if @supervisor_worker_cert.save
      redirect_to edit_supervisor_worker_supervisor_worker_cert_url(@supervisor_worker, @supervisor_worker_cert)
    else
      render :new
    end
  end
   

   
  def edit
    @supervisor_worker = SupervisorWorker.find(params[:supervisor_worker_id])
    @supervisor_worker_cert = @supervisor_worker.supervisor_worker_certs.find(params[:id])
  end
   

   
  def update
    @supervisor_worker = SupervisorWorker.find(params[:supervisor_worker_id])
    @supervisor_worker_cert = @supervisor_worker.supervisor_worker_certs.find(params[:id])

    if @supervisor_worker_cert.update(supervisor_worker_cert_params)
      redirect_to edit_supervisor_worker_supervisor_worker_cert_path(@supervisor_worker, @supervisor_worker_cert) 
    else
      render :edit
    end
  end


  private
    def supervisor_worker_cert_params
      params.require(:supervisor_worker_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

