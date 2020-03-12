class LaboursController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @labour = current_user.labour
    domain_major(@labour)
  end
   
   
  def update
    @labour = Labour.find(params[:id])
    domains = params["domain"]
    domain_hash = Hash.new
    domains.each do |d|
      next unless d =~ /,/
      domain_level = d.split(",")
      domain = domain_level[0]
      level = domain_level[1]
      domain_hash[domain] = level
    end
    @labour.domains.delete_all
    domain_hash.each do |k, v|
      LabourDomain.create(:level => v, :labour_id => @labour.id, :domain_id => k)
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
    @labour.majors.delete_all
    major_hash.each do |k, v|
      LabourMajor.create(:level => v, :labour_id => @labour.id, :major_id => k)
    end

    if @labour.update(labour_params)
      redirect_to edit_labour_path(@labour) 
    else
      domain_major(@labour)
      render :edit
    end
  end
   

  private
    def domain_major(labour)
      @domains = Domain.all
      labour_domains = labour.labour_domains
      @domain_hash = Hash.new
      labour_domains.each do |d|
        @domain_hash[d.domain_id] = d.level
      end

      @majors = Major.all
      labour_majors = labour.labour_majors
      @major_hash = Hash.new
      labour_majors.each do |d|
        @major_hash[d.major_id] = d.level
      end
    end

    def labour_params
      params.require(:labour).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

