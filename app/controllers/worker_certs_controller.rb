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
    hdct(@worker_cert)
  end
   

   
  def create
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = WorkerCert.new(worker_cert_params)
    @worker_cert.labour_worker = @labour_worker
    if @worker_cert.save
      hdcts = params["hdct"]
      hdct_hash = hash_hdct(hdcts)
      hdct_hash.each do |k, v|
        WorkerHdct.create(:level => v, :worker_cert_id => @worker_cert.id, :hdct_ctg_id => k)
      end
      redirect_to edit_labour_worker_worker_cert_url(@labour_worker, @worker_cert)
    else
      hdct(@worker_cert)
      render :new
    end
  end
   

   
  def edit
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = @labour_worker.worker_certs.find(params[:id])
    hdct(@worker_cert)
  end
   

   
  def update
    @labour_worker = LabourWorker.find(params[:labour_worker_id])
    @worker_cert = @labour_worker.worker_certs.find(params[:id])
    hdcts = params["hdct"]
    hdct_hash = hash_hdct(hdcts)
    @worker_cert.hdct_ctgs.delete_all
    hdct_hash.each do |k, v|
      WorkerHdct.create(:level => v, :worker_cert_id => @worker_cert.id, :hdct_ctg_id => k)
    end

    if @worker_cert.update(worker_cert_params)
      redirect_to edit_labour_worker_worker_cert_path(@labour_worker, @worker_cert) 
    else
      hdct(@worker_cert)
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
    def hdct(worker_cert)
      @hdcts = HdctCtg.all
      worker_cert_hdcts = worker_cert.worker_hdcts
      @hdct_hash = Hash.new
      worker_cert_hdcts.each do |d|
        @hdct_hash[d.hdct_ctg_id] = d.level
      end
    end

    def hash_hdct(hdcts) 
      hdct_hash = Hash.new
      hdcts.each do |d|
        next unless d =~ /,/
        hdct_level = d.split(",")
        hdct = hdct_level[0]
        level = hdct_level[1]
        hdct_hash[hdct] = level
      end
      hdct_hash
    end

    def worker_cert_params
      params.require(:worker_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

