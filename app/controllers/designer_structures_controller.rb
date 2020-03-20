class DesignerStructuresController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @designer = current_user.designer
    @designer_structures = @designer.designer_structures
  end
   
   
  def new
    @designer = current_user.designer
    @designer_structure = DesignerStructure.new
  end
   

   
  def create
    @designer_structure = DesignerStructure.new(designer_structure_params)
    @designer = current_user.designer
    @designer_structure.designer = @designer
    role = Role.find_by_name(Setting.roles.designer_structure)

    phone = @designer_structure.phone
    if phone.blank?
      render :new
      return
    end
    @user = User.find_by_phone(phone)
    if @user
      if exist_other_company?(@designer, @user)
        flash[:warning] = "请更改为其他员工"
        render :new
        return
      end
      if @user.designer_structure
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @designer_structure.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @designer_structure.user = @user
    end
    if @user.persisted? &&  @designer_structure.save
      save_cpt_dep_user(@designer, @designer_structure, @user)
      redirect_to edit_designer_designer_structure_path(@designer, @designer_structure) 
    else
      render :new
    end
  end
   

   
  def edit
    @designer = current_user.designer
    @designer_structure = @designer.designer_structures.find(params[:id])
  end
   

   
  def update
    @designer = current_user.designer
    @designer_structure = @designer.designer_structures.find(params[:id])
    phone = designer_structure_params[:phone]
    structure_phone = @designer_structure.phone
    if phone.blank?
      render :edit
      return
    end
    if @designer_structure.update(designer_structure_params)
      if phone != structure_phone 
        user = User.find_by_phone(structure_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_designer_designer_structure_path(@designer, @designer_structure) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer = current_user.designer
    @designer_structure = @designer.designer_structures.find(params[:id])
    @user = @designer_structure.user
    delete_cpt_dep_user(@designer, @designer_structure, @user)
    @designer_structure.destroy
    redirect_to :action => :index
  end
   
  private
    def designer_structure_params
      params.require(:designer_structure).permit( :name, :phone, :idno, :status, :idnumber , :idcard_front , :idcard_back , :stamp_front , :stamp_back , :hr_front , :hr_back)
    end
  
  
  
end

