class LabourHandlesController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @labour_handles = @labour.labour_handles
  end
   
   
  def new
    @labour_handle = LabourHandle.new
  end
   

   
  def create
    @labour_handle = LabourHandle.new(labour_handle_params)
    @labour = current_user.labour
    @labour_handle.labour = @labour
    role = Role.find_by_name(Setting.roles.labour_handle)

    phone = @labour_handle.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@labour, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.labour_handle
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @labour_handle.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @labour_handle.user = @user
    end
    if @user.persisted? &&  @labour_handle.save
      save_cpt_dep_user(@labour, @labour_handle, @user)
      redirect_to edit_labour_labour_handle_path(@labour, @labour_handle) 
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
    phone = labour_handle_params[:phone]
    handle_phone = @labour_handle.phone
    if phone.blank?
      render :edit
      return
    end
    if @labour_handle.update(labour_handle_params)
      if phone != handle_phone 
        user = User.find_by_phone(handle_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_labour_labour_handle_path(@labour, @labour_handle) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @labour_handle = @labour.labour_handles.find(params[:id])
    @user = @labour_handle.user
    delete_cpt_dep_user(@labour, @labour_handle, @user)
    @labour_handle.destroy
    redirect_to :action => :index
  end
   

  private
    def labour_handle_params
      params.require(:labour_handle).permit( :name, :phone, :idno , :idcard_front , :idcard_back , :hr_front , :hr_back , :stamp_front , :stamp_back)
    end
  
  
  
end

