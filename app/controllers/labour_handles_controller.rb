class LabourHandlesController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @labour_handles = @labour.labour_handles
  end
   

   
  def show
    @labour_handle = LabourHandle.find(params[:id])
  end
   

   
  def new
    @labour_handle = LabourHandle.new
  end
   

   
  def create
    @labour_handle = LabourHandle.new(labour_handle_params)
    @labour = current_user.labour
    @labour_handle.labour = @labour
    if @labour_handle.save
      redirect_to edit_labour_labour_handle(@labour, @labour_handle) 
    else
      render :new
    end
  end
   

   
  def edit
    @labour = current_user.labour
    @labour_handle = @labour.labour_handles.find(params[:id])
  end
   

   
  def update
    @labour = current_user.labour
    @labour_handle = @labour.labour_handles.find(params[:id])
    if @labour_handle.update(labour_handle_params)
      redirect_to labour_handle_path(@labour_handle) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @labour_handle = @labour.labour_handles.find(params[:id])
    @labour_handle.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def labour_handle_params
      params.require(:labour_handle).permit( :name, :phone, :idno , :idcard_front , :idcard_back , :hr_front , :hr_back , :stamp_front , :stamp_back)
    end
  
  
  
end

