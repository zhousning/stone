class ProjectPagesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   

   

   

   

   

   

   

  

  

  private
    def project_page_params
      params.require(:project_page).permit( :content)
    end
  
  
  
end

