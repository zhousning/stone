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
    certs(@line_cert, Setting.cert_ctgs.labour_line)
  end
   

   
  def create
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = LineCert.new(line_cert_params)
    @line_cert.labour_line = @labour_line
    if @line_cert.save
      certs = params["cert"]
      cert_hash = hash_cert(certs)
      cert_hash.each do |k, v|
        CertShip.create(:level => v, :foreign_idnumber => @line_cert.idnumber, :cert_ctg_id => k)
      end
      redirect_to edit_labour_line_line_cert_url(@labour_line, @line_cert)
    else
      certs(@line_cert, Setting.cert_ctgs.labour_line)
      render :new
    end
  end
   

   
  def edit
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = @labour_line.line_certs.find(params[:id])
    certs(@line_cert, Setting.cert_ctgs.labour_line)
  end
   

   
  def update
    @labour_line = LabourLine.find(params[:labour_line_id])
    @line_cert = @labour_line.line_certs.find(params[:id])
    certs = params["cert"]
    cert_hash = hash_cert(certs)
    @line_cert.cert_ctgs.delete_all
    cert_hash.each do |k, v|
      CertShip.create(:level => v, :foreign_idnumber => @line_cert.idnumber, :cert_ctg_id => k)
    end

    if @line_cert.update(line_cert_params)
      redirect_to edit_labour_line_line_cert_path(@labour_line, @line_cert) 
    else
      certs(@line_cert, Setting.cert_ctgs.labour_line)
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

    def line_cert_params
      params.require(:line_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
end

