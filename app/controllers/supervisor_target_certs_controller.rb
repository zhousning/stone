class SupervisorTargetCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @supervisor_target_certs = SupervisorTargetCert.all
  end
   

   

   
  def new
    @supervisor_target_cert = SupervisorTargetCert.new
    
  end
   

   
  def create
    @supervisor_target_cert = SupervisorTargetCert.new(supervisor_target_cert_params)
    #@supervisor_target_cert.user = current_user
    if @supervisor_target_cert.save
      redirect_to @supervisor_target_cert
    else
      render :new
    end
  end
   

   
  def edit
    @supervisor_target_cert = SupervisorTargetCert.find(params[:id])
  end
   

   
  def update
    @supervisor_target_cert = SupervisorTargetCert.find(params[:id])
    if @supervisor_target_cert.update(supervisor_target_cert_params)
      redirect_to supervisor_target_cert_path(@supervisor_target_cert) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @supervisor_target_cert = SupervisorTargetCert.find(params[:id])
    @supervisor_target_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def supervisor_target_cert_params
      params.require(:supervisor_target_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

