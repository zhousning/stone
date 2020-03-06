class DomainsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   

   

   

   

   

   

   

  

  

  private
    def domain_params
      params.require(:domain).permit( :name)
    end
  
  
  
end

