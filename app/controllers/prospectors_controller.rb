class ProspectorsController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @prospector = current_user.prospector
    domain_major(@prospector)
  end
   
   
  def update
    @prospector = Prospector.find(params[:id])
    domains = params["domain"]
    domain_hash = Hash.new
    domains.each do |d|
      next unless d =~ /,/
      domain_level = d.split(",")
      domain = domain_level[0]
      level = domain_level[1]
      domain_hash[domain] = level
    end
    @prospector.domains.delete_all
    domain_hash.each do |k, v|
      ProspectorDomain.create(:level => v, :prospector_id => @prospector.id, :domain_id => k)
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
    @prospector.majors.delete_all
    major_hash.each do |k, v|
      ProspectorMajor.create(:level => v, :prospector_id => @prospector.id, :major_id => k) 
    end

    if @prospector.update(prospector_params)
      redirect_to edit_prospector_path(@prospector) 
    else
      domain_major(@prospector)
      render :edit
    end
  end
   

  private
    def domain_major(prospector)
      @domains = Domain.all
      prospector_domains = prospector.prospector_domains
      @domain_hash = Hash.new
      prospector_domains.each do |d|
        @domain_hash[d.domain_id] = d.level
      end

      @majors = Major.all
      prospector_majors = prospector.prospector_majors
      @major_hash = Hash.new
      prospector_majors.each do |d|
        @major_hash[d.major_id] = d.level
      end
    end

    def prospector_params
      params.require(:prospector).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

