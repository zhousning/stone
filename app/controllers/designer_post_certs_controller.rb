class DesignerPostCertsController < ApplicationController
  include CtrlCtgCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    index_base("DesignerPost")
  end
   
  def new
    new_base("DesignerPost")
  end
   

   
  def create
    create_base("DesignerPost")
  end
   

   
  def edit
    edit_base("DesignerPost")
  end
   

   
  def update
    update_base("DesignerPost")
  end

   

   
  def destroy
    destroy_base("DesignerPost")
  end


  private
    def designer_post_cert_params
      params.require(:designer_post_cert).permit( :reg_no, :start, :cert_no, :end, :dep, :level, :status, :idnumber , :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

