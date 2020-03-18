ActiveAdmin.register CertCtg  do

  permit_params  :category, :name

  menu label: Setting.cert_ctgs.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :category, :label => Setting.cert_ctgs.category
  filter :name, :label => Setting.cert_ctgs.name
  filter :created_at

  index :title=>Setting.cert_ctgs.label + "管理" do
    selectable_column
    id_column
    
    column Setting.cert_ctgs.category, :category
    column Setting.cert_ctgs.name, :name

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.cert_ctgs.label do
      
      f.input :category, :label => Setting.cert_ctgs.category 
      f.input :name, :label => Setting.cert_ctgs.name 
    end
    f.actions
  end

  show :title=>Setting.cert_ctgs.label + "信息" do
    attributes_table do
      row "ID" do
        cert_ctg.id
      end
      
      row Setting.cert_ctgs.category do
        cert_ctg.category
      end
      row Setting.cert_ctgs.name do
        cert_ctg.name
      end

      row "创建时间" do
        cert_ctg.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        cert_ctg.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
