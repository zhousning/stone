class LiveCertsController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour_live = LabourLive.find(params[:labour_live_id])
    @live_certs = @labour_live.live_certs
  end
   
  def new
    @labour_live = LabourLive.find(params[:labour_live_id])
    @live_cert = LiveCert.new
    prf(@live_cert)
  end
   

   
  def create
    @labour_live = LabourLive.find(params[:labour_live_id])
    @live_cert = LiveCert.new(live_cert_params)
    @live_cert.labour_live = @labour_live
    if @live_cert.save
      prfs = params["prf"]
      prf_hash = hash_prf(prfs)
      prf_hash.each do |k, v|
        LivePrf.create(:level => v, :live_cert_id => @live_cert.id, :prf_ctg_id => k)
      end
      redirect_to edit_labour_live_live_cert_url(@labour_live, @live_cert)
    else
      prf(@live_cert)
      render :new
    end
  end
   

   
  def edit
    @labour_live = LabourLive.find(params[:labour_live_id])
    @live_cert = @labour_live.live_certs.find(params[:id])
    prf(@live_cert)
  end
   

   
  def update
    @labour_live = LabourLive.find(params[:labour_live_id])
    @live_cert = @labour_live.live_certs.find(params[:id])
    prfs = params["prf"]
    prf_hash = hash_prf(prfs)
    @live_cert.prf_ctgs.delete_all
    prf_hash.each do |k, v|
      LivePrf.create(:level => v, :live_cert_id => @live_cert.id, :prf_ctg_id => k)
    end

    if @live_cert.update(live_cert_params)
      redirect_to edit_labour_live_live_cert_path(@labour_live, @live_cert) 
    else
      prf(@live_cert)
      render :edit
    end
  end

   

   
  def destroy
    @labour_live = LabourLive.find(params[:labour_live_id])
    @live_cert = @labour_live.live_certs.find(params[:id])
    @live_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def prf(live_cert)
      @prfs = PrfCtg.all
      live_cert_prfs = live_cert.live_prfs
      @prf_hash = Hash.new
      live_cert_prfs.each do |d|
        @prf_hash[d.prf_ctg_id] = d.level
      end
    end

    def hash_prf(prfs) 
      prf_hash = Hash.new
      prfs.each do |d|
        next unless d =~ /,/
        prf_level = d.split(",")
        prf = prf_level[0]
        level = prf_level[1]
        prf_hash[prf] = level
      end
      prf_hash
    end

    def live_cert_params
      params.require(:live_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

