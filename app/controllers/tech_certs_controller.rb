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
    skill(@tech_cert)
  end
   

   
  def create
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = TechCert.new(tech_cert_params)
    @tech_cert.labour_tech = @labour_tech
    if @tech_cert.save
      skills = params["skill"]
      skill_hash = hash_skill(skills)
      skill_hash.each do |k, v|
        TechSkill.create(:level => v, :tech_cert_id => @tech_cert.id, :skill_ctg_id => k)
      end
      redirect_to edit_labour_tech_tech_cert_url(@labour_tech, @tech_cert)
    else
      skill(@tech_cert)
      render :new
    end
  end
   

   
  def edit
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = @labour_tech.tech_certs.find(params[:id])
    skill(@tech_cert)
  end
   

   
  def update
    @labour_tech = LabourTech.find(params[:labour_tech_id])
    @tech_cert = @labour_tech.tech_certs.find(params[:id])
    skills = params["skill"]
    skill_hash = hash_skill(skills)
    @tech_cert.skill_ctgs.delete_all
    skill_hash.each do |k, v|
      TechSkill.create(:level => v, :tech_cert_id => @tech_cert.id, :skill_ctg_id => k)
    end

    if @tech_cert.update(tech_cert_params)
      redirect_to edit_labour_tech_tech_cert_path(@labour_tech, @tech_cert) 
    else
      skill(@tech_cert)
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
    def skill(tech_cert)
      @skills = SkillCtg.all
      tech_cert_skills = tech_cert.tech_skills
      @skill_hash = Hash.new
      tech_cert_skills.each do |d|
        @skill_hash[d.skill_ctg_id] = d.level
      end
    end

    def hash_skill(skills) 
      skill_hash = Hash.new
      skills.each do |d|
        next unless d =~ /,/
        skill_level = d.split(",")
        skill = skill_level[0]
        level = skill_level[1]
        skill_hash[skill] = level
      end
      skill_hash
    end

    def tech_cert_params
      params.require(:tech_cert).permit( :reg_no, :cert_no, :start, :end, :dept, :level , :cert_front , :cert_back , :start_front , :start_back , :safe_front , :safe_back)
    end
  
  
  
end

