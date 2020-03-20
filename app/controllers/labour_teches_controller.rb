class LabourTechesController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @labour_teches = @labour.labour_teches
  end
   
   
  def new
    @labour_tech = LabourTech.new
  end
   

   
  def create
    @labour_tech = LabourTech.new(labour_tech_params)
    @labour = current_user.labour
    @labour_tech.labour = @labour
    role = Role.find_by_name(Setting.roles.labour_tech)

    phone = @labour_tech.phone
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
      if @user.labour_tech
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @labour_tech.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @labour_tech.user = @user
    end
    if @user.persisted? &&  @labour_tech.save
      save_cpt_dep_user(@labour, @labour_tech, @user)
      redirect_to edit_labour_labour_tech_path(@labour, @labour_tech) 
    else
      render :new
    end
  end
   

   
  def edit
    @labour = current_user.labour
    @labour_tech = @labour.labour_teches.find(params[:id])
  end
   

   
  def update
    @labour = current_user.labour
    @labour_tech = @labour.labour_teches.find(params[:id])
    phone = labour_tech_params[:phone]
    tech_phone = @labour_tech.phone
    if phone.blank?
      render :edit
      return
    end
    if @labour_tech.update(labour_tech_params)
      if phone != tech_phone 
        user = User.find_by_phone(tech_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_labour_labour_tech_path(@labour, @labour_tech) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @labour_tech = @labour.labour_teches.find(params[:id])
    @user = @labour_tech.user
    delete_cpt_dep_user(@labour, @labour_tech, @user)
    @labour_tech.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def labour_tech_params
      params.require(:labour_tech).permit( :name, :phone, :idno , :idcard_front , :idcard_back , :task_front , :task_back  , :hr_front , :hr_back , :stamp_front , :stamp_back)
    end
  
  
  
end

