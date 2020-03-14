class LabourLinesController < ApplicationController
  layout "application_control"
  #能看到这些的只有法人账户 role=施工单位
  #before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @labour = current_user.labour
    @labour_lines = @labour.labour_lines
  end
   
   
  def new
    @labour_line = LabourLine.new
  end
   

   
  def create
    @labour_line = LabourLine.new(labour_line_params)
    @labour = current_user.labour
    @labour_line.labour = @labour
    role = Role.find_by_name(Setting.roles.labour_line)

    phone = @labour_line.phone
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
      if @user.labour_line
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @labour_line.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @labour_line.user = @user
    end
    if @labour_line.save
      save_cpt_dep_user(@labour, @labour_line, @user)
      redirect_to edit_labour_labour_line_path(@labour, @labour_line) 
    else
      render :new
    end
  end
   

   
  def edit
    @labour = current_user.labour
    @labour_line = @labour.labour_lines.find(params[:id])
  end
   

   
  def update
    @labour = current_user.labour
    @labour_line = @labour.labour_lines.find(params[:id])
    phone = labour_line_params[:phone]
    line_phone = @labour_line.phone
    if phone.blank?
      render :edit
      return
    end
    if @labour_line.update(labour_line_params)
      if phone != line_phone 
        user = User.find_by_phone(line_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_labour_labour_line_path(@labour, @labour_line) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @labour = current_user.labour
    @labour_line = @labour.labour_lines.find(params[:id])
    @user = @labour_line.user
    delete_cpt_dep_user(@labour, @labour_line, @user)
    @labour_line.destroy
    redirect_to :action => :index
  end
   

  

  

  private
    def labour_line_params
      params.require(:labour_line).permit( :name, :phone, :idno , :idcard_front , :idcard_back , :hr_front , :hr_back , :stamp_front , :stamp_back)
    end
  
  
  
end

