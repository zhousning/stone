ActiveAdmin.register TableTemplate  do

  permit_params  :category, :number, :name, :info

  menu label: Setting.table_templates.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :category, :label => Setting.table_templates.category
  filter :number, :label => Setting.table_templates.number
  filter :name, :label => Setting.table_templates.name
  filter :info, :label => Setting.table_templates.info
  filter :created_at

  index :title=>Setting.table_templates.label + "管理" do
    selectable_column
    id_column
    
    column Setting.table_templates.category, :category
    column Setting.table_templates.number, :number
    column Setting.table_templates.name, :name
    column Setting.table_templates.info, :info

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.table_templates.label do
      
      f.input :category, :label => Setting.table_templates.category 
      f.input :number, :label => Setting.table_templates.number 
      f.input :name, :label => Setting.table_templates.name 
      f.input :info, :label => Setting.table_templates.info 
    end
    f.actions
  end

  show :title=>Setting.table_templates.label + "信息" do
    attributes_table do
      row "ID" do
        table_template.id
      end
      
      row Setting.table_templates.category do
        table_template.category
      end
      row Setting.table_templates.number do
        table_template.number
      end
      row Setting.table_templates.name do
        table_template.name
      end
      row Setting.table_templates.info do
        table_template.info
      end

      row "创建时间" do
        table_template.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        table_template.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
