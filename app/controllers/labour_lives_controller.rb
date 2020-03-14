class LabourLivesController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @labour_lives = @labour.labour_lives
  end
   
   
  def new
    @labour_live = LabourLive.new
  end
   

   
  def create
    @labour_live = LabourLive.new(labour_live_params)
    @labour = current_user.labour
    @labour_live.labour = @labour
    role = Role.find_by_name(Setting.roles.labour_live)

    phone = @labour_live.phone
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
      if @user.labour_live
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @labour_live.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @labour_live.user = @user
    end
    if @labour_live.save
      save_cpt_dep_user(@labour, @labour_live, @user)
      redirect_to edit_labour_labour_live_path(@labour, @labour_live) 
    else
      render :new
    end
  end
   

   
  def edit
    @labour = current_user.labour
    @labour_live = @labour.labour_lives.find(params[:id])
  end
   

   
  def update
    @labour = current_user.labour
    @labour_live = @labour.labour_lives.find(params[:id])
    phone = labour_live_params[:phone]
    live_phone = @labour_live.phone
    if phone.blank?
      render :edit
      return
    end
    if @labour_live.update(labour_live_params)
      if phone != live_phone 
        user = User.find_by_phone(live_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_labour_labour_live_path(@labour, @labour_live) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @labour_live = @labour.labour_lives.find(params[:id])
    @user = @labour_live.user
    delete_cpt_dep_user(@labour, @labour_live, @user)
    @labour_live.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def labour_live_params
      params.require(:labour_live).permit( :name, :phone, :idno , :idcard_front , :idcard_back , :hr_front , :hr_back , :stamp_front , :stamp_back)
    end
  
  
  
end

