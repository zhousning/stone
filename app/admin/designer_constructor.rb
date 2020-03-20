ActiveAdmin.register DesignerConstructor  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.designer_constructors.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.designer_constructors.name
  filter :phone, :label => Setting.designer_constructors.phone
  filter :idno, :label => Setting.designer_constructors.idno
  filter :status, :label => Setting.designer_constructors.status
  filter :idnumber, :label => Setting.designer_constructors.idnumber
  filter :created_at

  index :title=>Setting.designer_constructors.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_constructors.name, :name
    column Setting.designer_constructors.phone, :phone
    column Setting.designer_constructors.idno, :idno
    column Setting.designer_constructors.status, :status
    column Setting.designer_constructors.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_constructors.label do
      
      f.input :name, :label => Setting.designer_constructors.name 
      f.input :phone, :label => Setting.designer_constructors.phone 
      f.input :idno, :label => Setting.designer_constructors.idno 
      f.input :status, :label => Setting.designer_constructors.status 
      f.input :idnumber, :label => Setting.designer_constructors.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_constructors.label + "信息" do
    attributes_table do
      row "ID" do
        designer_constructor.id
      end
      
      row Setting.designer_constructors.name do
        designer_constructor.name
      end
      row Setting.designer_constructors.phone do
        designer_constructor.phone
      end
      row Setting.designer_constructors.idno do
        designer_constructor.idno
      end
      row Setting.designer_constructors.status do
        designer_constructor.status
      end
      row Setting.designer_constructors.idnumber do
        designer_constructor.idnumber
      end

      row "创建时间" do
        designer_constructor.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_constructor.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
