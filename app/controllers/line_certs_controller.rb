class LineCertsController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_certs = @labour_line.line_certs
  end
   
  def new
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = LineCert.new
    prf(@line_cert)
  end
   

   
  def create
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = LineCert.new(line_cert_params)
    @line_cert.labour_line = @labour_line
    if @line_cert.save
      prfs = params["prf"]
      prf_hash = hash_prf(prfs)
      prf_hash.each do |k, v|
        LinePrf.create(:level => v, :line_cert_id => @line_cert.id, :prf_ctg_id => k)
      end
      redirect_to edit_labour_line_line_cert_url(@labour_line, @line_cert)
    else
      prf(@line_cert)
      render :new
    end
  end
   

   
  def edit
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = @labour_line.line_certs.find(params[:id])
    prf(@line_cert)
  end
   

   
  def update
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = @labour_line.line_certs.find(params[:id])
    prfs = params["prf"]
    prf_hash = hash_prf(prfs)
    @line_cert.prf_ctgs.delete_all
    prf_hash.each do |k, v|
      LinePrf.create(:level => v, :line_cert_id => @line_cert.id, :prf_ctg_id => k)
    end

    if @line_cert.update(line_cert_params)
      redirect_to edit_labour_line_line_cert_path(@labour_line, @line_cert) 
    else
      prf(@line_cert)
      render :edit
    end
  end

   

   
  def destroy
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = @labour_line.line_certs.find(params[:id])
    @line_cert.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def prf(line_cert)
      @prfs = PrfCtg.all
      line_cert_prfs = line_cert.line_prfs
      @prf_hash = Hash.new
      line_cert_prfs.each do |d|
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

    def line_cert_params
      params.require(:line_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

