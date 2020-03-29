ActiveAdmin.register ProjectGroup  do

  permit_params  :name, :status, :idnumber

  menu label: Setting.project_groups.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.project_groups.name
  filter :status, :label => Setting.project_groups.status
  filter :idnumber, :label => Setting.project_groups.idnumber
  filter :created_at

  index :title=>Setting.project_groups.label + "管理" do
    selectable_column
    id_column
    
    column Setting.project_groups.name, :name
    column Setting.project_groups.status, :status
    column Setting.project_groups.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.project_groups.label do
      
      f.input :name, :label => Setting.project_groups.name 
      f.input :status, :label => Setting.project_groups.status 
      f.input :idnumber, :label => Setting.project_groups.idnumber 
    end
    f.actions
  end

  show :title=>Setting.project_groups.label + "信息" do
    attributes_table do
      row "ID" do
        project_group.id
      end
      
      row Setting.project_groups.name do
        project_group.name
      end
      row Setting.project_groups.status do
        project_group.status
      end
      row Setting.project_groups.idnumber do
        project_group.idnumber
      end

      row "创建时间" do
        project_group.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        project_group.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
