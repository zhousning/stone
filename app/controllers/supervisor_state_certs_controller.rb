class SupervisorStateCertsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    @supervisor_state = SupervisorState.find(params[:supervisor_state_id])
    @supervisor_state_certs = @supervisor_state.supervisor_state_certs
  end
   
  def new
    @supervisor_state = SupervisorState.find(params[:supervisor_state_id])
    @supervisor_state_cert = SupervisorStateCert.new
  end
   

   
  def create
    @supervisor_state = SupervisorState.find(params[:supervisor_state_id])
    @supervisor_state_cert = SupervisorStateCert.new(supervisor_state_cert_params)
    @supervisor_state_cert.supervisor_state = @supervisor_state
    if @supervisor_state_cert.save
      redirect_to edit_supervisor_state_supervisor_state_cert_url(@supervisor_state, @supervisor_state_cert)
    else
      render :new
    end
  end
   

   
  def edit
    @supervisor_state = SupervisorState.find(params[:supervisor_state_id])
    @supervisor_state_cert = @supervisor_state.supervisor_state_certs.find(params[:id])
  end
   

   
  def update
    @supervisor_state = SupervisorState.find(params[:supervisor_state_id])
    @supervisor_state_cert = @supervisor_state.supervisor_state_certs.find(params[:id])

    if @supervisor_state_cert.update(supervisor_state_cert_params)
      redirect_to edit_supervisor_state_supervisor_state_cert_path(@supervisor_state, @supervisor_state_cert) 
    else
      render :edit
    end
  end

   


  private
    def supervisor_state_cert_params
      params.require(:supervisor_state_cert).permit( :reg_no, :start, :cert_no, :end, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

