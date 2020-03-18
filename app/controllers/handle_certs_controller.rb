class HandleCertsController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_certs = @labour_handle.handle_certs
  end
   
  def new
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = HandleCert.new
    certs(@handle_cert, Setting.cert_ctgs.labour_handle)
  end
   

   
  def create
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = HandleCert.new(handle_cert_params)
    @handle_cert.labour_handle = @labour_handle
    if @handle_cert.save
      certs = params["cert"]
      cert_hash = hash_cert(certs)
      cert_hash.each do |k, v|
        CertShip.create(:level => v, :foreign_idnumber => @handle_cert.idnumber, :cert_ctg_id => k)
      end
      redirect_to edit_labour_handle_handle_cert_url(@labour_handle, @handle_cert)
    else
      certs(@handle_cert, Setting.cert_ctgs.labour_handle)
      render :new
    end
  end
   

   
  def edit
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = @labour_handle.handle_certs.find(params[:id])
    certs(@handle_cert, Setting.cert_ctgs.labour_handle)
  end
   

   
  def update
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = @labour_handle.handle_certs.find(params[:id])
    certs = params["cert"]
    cert_hash = hash_cert(certs)
    @handle_cert.cert_ctgs.delete_all
    cert_hash.each do |k, v|
      CertShip.create(:level => v, :foreign_idnumber => @handle_cert.idnumber, :cert_ctg_id => k)
    end

    if @handle_cert.update(handle_cert_params)
      redirect_to edit_labour_handle_handle_cert_path(@labour_handle, @handle_cert) 
    else
      certs(@handle_cert, Setting.cert_ctgs.labour_handle)
      render :edit
    end
  end

   

   
  def destroy
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = @labour_handle.handle_certs.find(params[:id])
    @handle_cert.destroy
    redirect_to :action => :index
  end
   
   
  private

    def handle_cert_params
      params.require(:handle_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

