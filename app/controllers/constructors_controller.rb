class ConstructorsController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit
    @constructor = current_user.constructor
  end
   

   
  def update
    @constructor = Constructor.find(params[:id])
    if @constructor.update(constructor_params)
      redirect_to edit_constructor_path(@constructor) 
    else
      render :edit
    end
  end
   

  private
    def constructor_params
      params.require(:constructor).permit( :company, :cert, :cert_front, :cert_back, :quality_front, :quality_back, :corp, :address, :idcard, :province, :city, :county, :habitation)
    end
  
  
  
end

