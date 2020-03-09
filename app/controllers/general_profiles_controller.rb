class GeneralProfilesController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @general_profile = current_user.general_profile
    @domains = Domain.all
    user_domains = current_user.user_domains
    @domain_hash = Hash.new
    user_domains.each do |d|
      @domain_hash[d.domain_id] = d.level
    end

    @majors = Major.all
    user_majors = current_user.user_majors
    @major_hash = Hash.new
    user_majors.each do |d|
      @major_hash[d.major_id] = d.level
    end
  end
   

   
  def update
    @general_profile = GeneralProfile.find(params[:id])
    domains = params["domain"]
    domain_hash = Hash.new
    domains.each do |d|
      next unless d =~ /,/
      domain_level = d.split(",")
      domain = domain_level[0]
      level = domain_level[1]
      domain_hash[domain] = level
    end
    if domain_hash.size != 0
      current_user.domains.delete_all
      domain_hash.each do |k, v|
        UserDomain.create(:level => v, :user_id => current_user.id, :domain_id => k)
      end
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
    if major_hash.size != 0
      current_user.majors.delete_all
      major_hash.each do |k, v|
        UserMajor.create(:level => v, :user_id => current_user.id, :major_id => k)
      end
    end

    if @general_profile.update(general_profile_params)
      redirect_to edit_general_profile_path(@general_profile) 
    else
      render :edit
    end
  end
   

  private
    def general_profile_params
      params.require(:general_profile).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

