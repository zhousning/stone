class DesignersController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @designer = current_user.designer
    domain_major(@designer)
  end
   
   
  def update
    @designer = Designer.find(params[:id])
    domains = params["domain"]
    domain_hash = Hash.new
    domains.each do |d|
      next unless d =~ /,/
      domain_level = d.split(",")
      domain = domain_level[0]
      level = domain_level[1]
      domain_hash[domain] = level
    end
    @designer.domains.delete_all
    domain_hash.each do |k, v|
      DesignerDomain.create(:level => v, :designer_id => @designer.id, :domain_id => k)
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
    @designer.majors.delete_all
    major_hash.each do |k, v|
      DesignerMajor.create(:level => v, :designer_id => @designer.id, :major_id => k)
    end

    if @designer.update(designer_params)
      redirect_to edit_designer_path(@designer) 
    else
      domain_major(@designer)
      render :edit
    end
  end
   

  private
    def domain_major(designer)
      @domains = Domain.all
      designer_domains = designer.designer_domains
      @domain_hash = Hash.new
      designer_domains.each do |d|
        @domain_hash[d.domain_id] = d.level
      end

      @majors = Major.all
      designer_majors = designer.designer_majors
      @major_hash = Hash.new
      designer_majors.each do |d|
        @major_hash[d.major_id] = d.level
      end
    end

    def designer_params
      params.require(:designer).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

