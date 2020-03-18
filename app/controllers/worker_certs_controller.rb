class WorkerCertsController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource
  
  def index
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_certs = @labour_worker.worker_certs
  end
   
  def new
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = WorkerCert.new
    certs(@worker_cert, Setting.cert_ctgs.labour_worker)
  end
   

   
  def create
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = WorkerCert.new(worker_cert_params)
    @worker_cert.labour_worker = @labour_worker
    if @worker_cert.save
      certs = params["cert"]
      cert_hash = hash_cert(certs)
      cert_hash.each do |k, v|
        CertShip.create(:level => v, :foreign_idnumber => @worker_cert.idnumber, :cert_ctg_id => k)
      end
      redirect_to edit_labour_worker_worker_cert_url(@labour_worker, @worker_cert)
    else
      certs(@worker_cert, Setting.cert_ctgs.labour_worker)
      render :new
    end
  end
   

   
  def edit
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = @labour_worker.worker_certs.find(params[:id])
    certs(@worker_cert, Setting.cert_ctgs.labour_worker)
  end
   

   
  def update
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = @labour_worker.worker_certs.find(params[:id])
    certs = params["cert"]
    cert_hash = hash_cert(certs)
    @worker_cert.cert_ctgs.delete_all
    cert_hash.each do |k, v|
      CertShip.create(:level => v, :foreign_idnumber => @worker_cert.idnumber, :cert_ctg_id => k)
    end

    if @worker_cert.update(worker_cert_params)
      redirect_to edit_labour_worker_worker_cert_path(@labour_worker, @worker_cert) 
    else
      certs(@worker_cert, Setting.cert_ctgs.labour_worker)
      render :edit
    end
  end

   

   
  def destroy
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = @labour_worker.worker_certs.find(params[:id])
    @worker_cert.destroy
    redirect_to :action => :index
  end
   
   
  
  private
    def worker_cert_params
      params.require(:worker_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

