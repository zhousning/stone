class TablePagesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   

   

   

   

   

   

   

  

  

  private
    def table_page_params
      params.require(:table_page).permit( :html, :style)
    end
  
  
  
end

