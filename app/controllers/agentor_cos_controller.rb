class AgentorCosController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @agentor_co = current_user.agentor_co
    domain_major(@agentor_co)
  end
   
   
  def update
    @agentor_co = AgentorCo.find(params[:id])
    domains = params["domain"]
    domain_hash = Hash.new
    domains.each do |d|
      next unless d =~ /,/
      domain_level = d.split(",")
      domain = domain_level[0]
      level = domain_level[1]
      domain_hash[domain] = level
    end
    @agentor_co.domains.delete_all
    domain_hash.each do |k, v|
      AgentorDomain.create(:level => v, :agentor_co_id => @agentor_co.id, :domain_id => k)
    end

    majors = params["major"]
    major_hash = Hash.new
    majors.each do |d|
      next unless d =~ /,/
      major_level = d.split(",")
      major = major_level[0]
      level = major_level[1]
      major_hash[major] = level
    end
    @agentor_co.majors.delete_all
    major_hash.each do |k, v|
      AgentorMajor.create(:level => v, :agentor_co_id => @agentor_co.id, :major_id => k)
    end

    if @agentor_co.update(agentor_co_params)
      redirect_to edit_agentor_co_path(@agentor_co) 
    else
      domain_major(@agentor_co)
      render :edit
    end
  end
   

  private
    def domain_major(agentor_co)
      @domains = Domain.all
      agentor_co_domains = agentor_co.agentor_domains
      @domain_hash = Hash.new
      agentor_co_domains.each do |d|
        @domain_hash[d.domain_id] = d.level
      end

      @majors = Major.all
      agentor_co_majors = agentor_co.agentor_majors
      @major_hash = Hash.new
      agentor_co_majors.each do |d|
        @major_hash[d.major_id] = d.level
      end
    end

    def agentor_co_params
      params.require(:agentor_co).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

