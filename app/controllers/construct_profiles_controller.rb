class ConstructProfilesController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit
    @construct_profile = current_user.construct_profile
  end
   

   
  def update
    @construct_profile = ConstructProfile.find(params[:id])
    if @construct_profile.update(construct_profile_params)
      redirect_to edit_construct_profile_path(@construct_profile) 
    else
      render :edit
    end
  end
   

  private
    def construct_profile_params
      params.require(:construct_profile).permit( :company, :cert, :cert_front, :cert_back, :quality_front, :quality_back, :corp, :address, :idcard, :province, :city, :county, :habitation)
    end
  
  
  
end

