ActiveAdmin.register Domain  do

  permit_params  :name

  menu label: Setting.domains.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.domains.name
  filter :created_at

  index :title=>Setting.domains.label + "管理" do
    selectable_column
    id_column
    
    column Setting.domains.name, :name

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.domains.label do
      
      f.input :name, :label => Setting.domains.name 
    end
    f.actions
  end

  show :title=>Setting.domains.label + "信息" do
    attributes_table do
      row "ID" do
        domain.id
      end
      
      row Setting.domains.name do
        domain.name
      end

      row "创建时间" do
        domain.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        domain.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
