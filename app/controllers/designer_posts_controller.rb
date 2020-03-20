class DesignerPostsController < ApplicationController
  layout "application_control"
  before_filter :authenticate_user!
  #load_and_authorize_resource

   
  def index
    @designer = current_user.designer
    @designer_posts = @designer.designer_posts
  end
   
   
  def new
    @designer = current_user.designer
    @designer_post = DesignerPost.new
  end
   

   
  def create
    @designer_post = DesignerPost.new(designer_post_params)
    @designer = current_user.designer
    @designer_post.designer = @designer
    role = Role.find_by_name(Setting.roles.designer_post)

    phone = @designer_post.phone
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
      if @user.designer_post
        flash[:warning] = "该项目经理已存在"
        render :new
        return
      else
        @user.roles << role
        @designer_post.user = @user
      end
    else
      @user = User.new(:phone => phone , :password => phone , :password_confirmation => phone)
      @user.roles << role
      @user.save
      @designer_post.user = @user
    end
    if @user.persisted? &&  @designer_post.save
      save_cpt_dep_user(@designer, @designer_post, @user)
      redirect_to edit_designer_designer_post_path(@designer, @designer_post) 
    else
      render :new
    end
  end
   

   
  def edit
    @designer = current_user.designer
    @designer_post = @designer.designer_posts.find(params[:id])
  end
   

   
  def update
    @designer = current_user.designer
    @designer_post = @designer.designer_posts.find(params[:id])
    phone = designer_post_params[:phone]
    post_phone = @designer_post.phone
    if phone.blank?
      render :edit
      return
    end
    if @designer_post.update(designer_post_params)
      if phone != post_phone 
        user = User.find_by_phone(post_phone)
        user.update(:phone => phone)
      end
      redirect_to edit_designer_designer_post_path(@designer, @designer_post) 
    else
      render :edit
    end
  end
   

   
  def destroy
    @designer = current_user.designer
    @designer_post = @designer.designer_posts.find(params[:id])
    @user = @designer_post.user
    delete_cpt_dep_user(@designer, @designer_post, @user)
    @designer_post.destroy
    redirect_to :action => :index
  end
   


  private
    def designer_post_params
      params.require(:designer_post).permit( :name, :phone, :idno, :status, :idnumber , :idcard_front , :idcard_back , :task_front , :task_back , :hr_front , :hr_back)
    end
  
  
  
end

