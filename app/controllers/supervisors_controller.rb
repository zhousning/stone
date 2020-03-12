class SupervisorsController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @supervisor = current_user.supervisor
    domain_major(@supervisor)
  end
   
   
  def update
    @supervisor = Supervisor.find(params[:id])
    domains = params["domain"]
    domain_hash = Hash.new
    domains.each do |d|
      next unless d =~ /,/
      domain_level = d.split(",")
      domain = domain_level[0]
      level = domain_level[1]
      domain_hash[domain] = level
    end
    @supervisor.domains.delete_all
    domain_hash.each do |k, v|
      SupervisorDomain.create(:level => v, :supervisor_id => @supervisor.id, :domain_id => k)
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
    @supervisor.majors.delete_all
    major_hash.each do |k, v|
      SupervisorMajor.create(:level => v, :supervisor_id => @supervisor.id, :major_id => k)
    end

    if @supervisor.update(supervisor_params)
      redirect_to edit_supervisor_path(@supervisor) 
    else
      domain_major(@supervisor)
      render :edit
    end
  end
   

  private
    def domain_major(supervisor)
      @domains = Domain.all
      supervisor_domains = supervisor.supervisor_domains
      @domain_hash = Hash.new
      supervisor_domains.each do |d|
        @domain_hash[d.domain_id] = d.level
      end

      @majors = Major.all
      supervisor_majors = supervisor.supervisor_majors
      @major_hash = Hash.new
      supervisor_majors.each do |d|
        @major_hash[d.major_id] = d.level
      end
    end

    def supervisor_params
      params.require(:supervisor).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

