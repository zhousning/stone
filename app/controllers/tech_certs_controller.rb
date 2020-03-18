class TechCertsController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

  def index
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_certs = @labour_tech.tech_certs
  end
   
  def new
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = TechCert.new
    certs(@tech_cert, Setting.cert_ctgs.labour_tech)
  end
   

   
  def create
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = TechCert.new(tech_cert_params)
    @tech_cert.labour_tech = @labour_tech
    if @tech_cert.save
      certs = params["cert"]
      cert_hash = hash_cert(certs)
      cert_hash.each do |k, v|
        CertShip.create(:level => v, :foreign_idnumber => @tech_cert.idnumber, :cert_ctg_id => k)
      end
      redirect_to edit_labour_tech_tech_cert_url(@labour_tech, @tech_cert)
    else
      certs(@tech_cert, Setting.cert_ctgs.labour_tech)
      render :new
    end
  end
   

   
  def edit
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = @labour_tech.tech_certs.find(params[:id])
    certs(@tech_cert, Setting.cert_ctgs.labour_tech)
  end
   

   
  def update
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = @labour_tech.tech_certs.find(params[:id])
    certs = params["cert"]
    cert_hash = hash_cert(certs)
    @tech_cert.cert_ctgs.delete_all
    cert_hash.each do |k, v|
      CertShip.create(:level => v, :foreign_idnumber => @tech_cert.idnumber, :cert_ctg_id => k)
    end

    if @tech_cert.update(tech_cert_params)
      redirect_to edit_labour_tech_tech_cert_path(@labour_tech, @tech_cert) 
    else
      certs(@tech_cert, Setting.cert_ctgs.labour_tech)
      render :edit
    end
  end

   

   
  def destroy
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = @labour_tech.tech_certs.find(params[:id])
    @tech_cert.destroy
    redirect_to :action => :index
  end
   
   
  private

    def tech_cert_params
      params.require(:tech_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

