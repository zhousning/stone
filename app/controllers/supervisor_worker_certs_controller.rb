class SupervisorWorkerCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @supervisor_worker_certs = SupervisorWorkerCert.all
  end
   

   

   
  def new
    @supervisor_worker_cert = SupervisorWorkerCert.new
    
  end
   

   
  def create
    @supervisor_worker_cert = SupervisorWorkerCert.new(supervisor_worker_cert_params)
    #@supervisor_worker_cert.user = current_user
    if @supervisor_worker_cert.save
      redirect_to @supervisor_worker_cert
    else
      render :new
    end
  end
   

   
  def edit
    @supervisor_worker_cert = SupervisorWorkerCert.find(params[:id])
  end
   

   
  def update
    @supervisor_worker_cert = SupervisorWorkerCert.find(params[:id])
    if @supervisor_worker_cert.update(supervisor_worker_cert_params)
      redirect_to supervisor_worker_cert_path(@supervisor_worker_cert) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @supervisor_worker_cert = SupervisorWorkerCert.find(params[:id])
    @supervisor_worker_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def supervisor_worker_cert_params
      params.require(:supervisor_worker_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

