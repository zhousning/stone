class GeneralProfilesController < ApplicationController
  layout "application_control"
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def edit 
    @general_profile = current_user.general_profile
  end
   

   
  def update
    @general_profile = GeneralProfile.find(params[:id])
    if @general_profile.update(general_profile_params)
      redirect_to edit_general_profile_path(@general_profile) 
    else
      render :edit
    end
  end
   

  private
    def general_profile_params
      params.require(:general_profile).permit( :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation , :cert_front, :cert_back, :quality_front, :quality_back, :quality_one_front, :quality_one_back, :quality_two_front, :quality_two_back, :quality_three_front, :quality_three_back, :safe_front, :safe_back)
    end
  
  
  
end

