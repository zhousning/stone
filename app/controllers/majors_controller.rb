class MajorsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   

   

   

   

   

   

   

  

  

  private
    def major_params
      params.require(:major).permit( :name)
    end
  
  
  
end

