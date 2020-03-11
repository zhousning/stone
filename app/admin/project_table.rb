ActiveAdmin.register ProjectTable  do

  permit_params  :category, :number, :name, :info

  menu label: Setting.project_tables.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :category, :label => Setting.project_tables.category
  filter :number, :label => Setting.project_tables.number
  filter :name, :label => Setting.project_tables.name
  filter :info, :label => Setting.project_tables.info
  filter :created_at

  index :title=>Setting.project_tables.label + "管理" do
    selectable_column
    id_column
    
    column Setting.project_tables.category, :category
    column Setting.project_tables.number, :number
    column Setting.project_tables.name, :name
    column Setting.project_tables.info, :info

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.project_tables.label do
      
      f.input :category, :label => Setting.project_tables.category 
      f.input :number, :label => Setting.project_tables.number 
      f.input :name, :label => Setting.project_tables.name 
      f.input :info, :label => Setting.project_tables.info 
    end
    f.actions
  end

  show :title=>Setting.project_tables.label + "信息" do
    attributes_table do
      row "ID" do
        project_table.id
      end
      
      row Setting.project_tables.category do
        project_table.category
      end
      row Setting.project_tables.number do
        project_table.number
      end
      row Setting.project_tables.name do
        project_table.name
      end
      row Setting.project_tables.info do
        project_table.info
      end

      row "创建时间" do
        project_table.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        project_table.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
