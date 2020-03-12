class MonitorCosController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @monitor_co = current_user.monitor_co
    domain_major(@monitor_co)
  end
   
   
  def update
    @monitor_co = MonitorCo.find(params[:id])
    domains = params["domain"]
    domain_hash = Hash.new
    domains.each do |d|
      next unless d =~ /,/
      domain_level = d.split(",")
      domain = domain_level[0]
      level = domain_level[1]
      domain_hash[domain] = level
    end
    @monitor_co.domains.delete_all
    domain_hash.each do |k, v|
      MonitorDomain.create(:level => v, :monitor_co_id => @monitor_co.id, :domain_id => k)
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
    @monitor_co.majors.delete_all
    major_hash.each do |k, v|
      MonitorMajor.create(:level => v, :monitor_co_id => @monitor_co.id, :major_id => k)
    end

    if @monitor_co.update(monitor_co_params)
      redirect_to edit_monitor_co_path(@monitor_co) 
    else
      domain_major(@monitor_co)
      render :edit
    end
  end
   

  private
    def domain_major(monitor_co)
      @domains = Domain.all
      monitor_co_domains = monitor_co.monitor_domains
      @domain_hash = Hash.new
      monitor_co_domains.each do |d|
        @domain_hash[d.domain_id] = d.level
      end

      @majors = Major.all
      monitor_co_majors = monitor_co.monitor_majors
      @major_hash = Hash.new
      monitor_co_majors.each do |d|
        @major_hash[d.major_id] = d.level
      end
    end

    def monitor_co_params
      params.require(:monitor_co).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

