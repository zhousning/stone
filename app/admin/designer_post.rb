ActiveAdmin.register DesignerPost  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.designer_posts.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.designer_posts.name
  filter :phone, :label => Setting.designer_posts.phone
  filter :idno, :label => Setting.designer_posts.idno
  filter :status, :label => Setting.designer_posts.status
  filter :idnumber, :label => Setting.designer_posts.idnumber
  filter :created_at

  index :title=>Setting.designer_posts.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_posts.name, :name
    column Setting.designer_posts.phone, :phone
    column Setting.designer_posts.idno, :idno
    column Setting.designer_posts.status, :status
    column Setting.designer_posts.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_posts.label do
      
      f.input :name, :label => Setting.designer_posts.name 
      f.input :phone, :label => Setting.designer_posts.phone 
      f.input :idno, :label => Setting.designer_posts.idno 
      f.input :status, :label => Setting.designer_posts.status 
      f.input :idnumber, :label => Setting.designer_posts.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_posts.label + "信息" do
    attributes_table do
      row "ID" do
        designer_post.id
      end
      
      row Setting.designer_posts.name do
        designer_post.name
      end
      row Setting.designer_posts.phone do
        designer_post.phone
      end
      row Setting.designer_posts.idno do
        designer_post.idno
      end
      row Setting.designer_posts.status do
        designer_post.status
      end
      row Setting.designer_posts.idnumber do
        designer_post.idnumber
      end

      row "创建时间" do
        designer_post.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_post.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
