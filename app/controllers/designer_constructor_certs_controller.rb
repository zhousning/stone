class DesignerConstructorCertsController < ApplicationController
  include CtrlCert
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource


  def index
    index_base("DesignerConstructor")
  end
   
  def new
    new_base("DesignerConstructor")
  end
   

   
  def create
    create_base("DesignerConstructor")
  end
   

   
  def edit
    edit_base("DesignerConstructor")
  end
   

   
  def update
    update_base("DesignerConstructor")
  end

   

   
  def destroy
    destroy_base("DesignerConstructor")
  end

  private
    def designer_constructor_cert_params
      params.require(:designer_constructor_cert).permit( :reg_no, :start, :cert_no, :end, :level, :cert_front , :cert_back , :start_front , :start_back)
    end
  
  
  
end

