ActiveAdmin.register ArctCtg  do

  permit_params  :name, :level

  menu label: Setting.arct_ctgs.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.arct_ctgs.name
  filter :level, :label => Setting.arct_ctgs.level
  filter :created_at

  index :title=>Setting.arct_ctgs.label + "管理" do
    selectable_column
    id_column
    
    column Setting.arct_ctgs.name, :name
    column Setting.arct_ctgs.level, :level

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.arct_ctgs.label do
      
      f.input :name, :label => Setting.arct_ctgs.name 
      f.input :level, :label => Setting.arct_ctgs.level 
    end
    f.actions
  end

  show :title=>Setting.arct_ctgs.label + "信息" do
    attributes_table do
      row "ID" do
        arct_ctg.id
      end
      
      row Setting.arct_ctgs.name do
        arct_ctg.name
      end
      row Setting.arct_ctgs.level do
        arct_ctg.level
      end

      row "创建时间" do
        arct_ctg.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        arct_ctg.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
