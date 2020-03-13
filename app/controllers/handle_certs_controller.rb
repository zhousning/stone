class HandleCertsController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_certs = @labour_handle.handle_certs
  end
   
  def new
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = HandleCert.new
    arct(@handle_cert)
  end
   

   
  def create
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = HandleCert.new(handle_cert_params)
    @handle_cert.labour_handle = @labour_handle
    if @handle_cert.save
      arcts = params["arct"]
      arct_hash = hash_arct(arcts)
      arct_hash.each do |k, v|
        HandleArct.create(:level => v, :handle_cert_id => @handle_cert.id, :arct_ctg_id => k)
      end
      redirect_to edit_labour_handle_handle_cert_url(@labour_handle, @handle_cert)
    else
      arct(@handle_cert)
      render :new
    end
  end
   

   
  def edit
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = @labour_handle.handle_certs.find(params[:id])
    arct(@handle_cert)
  end
   

   
  def update
    @labour_handle = LabourHandle.find(params[:labour_handle_id])
    @handle_cert = @labour_handle.handle_certs.find(params[:id])
    arcts = params["arct"]
    arct_hash = hash_arct(arcts)
    @handle_cert.arct_ctgs.delete_all
    arct_hash.each do |k, v|
      HandleArct.create(:level => v, :handle_cert_id => @handle_cert.id, :arct_ctg_id => k)
    end

    if @handle_cert.update(handle_cert_params)
      redirect_to edit_labour_handle_handle_cert_path(@labour_handle, @handle_cert) 
    else
      arct(@handle_cert)
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
    def arct(handle_cert)
      @arcts = ArctCtg.all
      handle_cert_arcts = handle_cert.handle_arcts
      @arct_hash = Hash.new
      handle_cert_arcts.each do |d|
        @arct_hash[d.arct_ctg_id] = d.level
      end
    end

    def hash_arct(arcts) 
      arct_hash = Hash.new
      arcts.each do |d|
        next unless d =~ /,/
        arct_level = d.split(",")
        arct = arct_level[0]
        level = arct_level[1]
        arct_hash[arct] = level
      end
      arct_hash
    end

    def handle_cert_params
      params.require(:handle_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

