ActiveAdmin.register DesignerWarm  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.designer_warms.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.designer_warms.name
  filter :phone, :label => Setting.designer_warms.phone
  filter :idno, :label => Setting.designer_warms.idno
  filter :status, :label => Setting.designer_warms.status
  filter :idnumber, :label => Setting.designer_warms.idnumber
  filter :created_at

  index :title=>Setting.designer_warms.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_warms.name, :name
    column Setting.designer_warms.phone, :phone
    column Setting.designer_warms.idno, :idno
    column Setting.designer_warms.status, :status
    column Setting.designer_warms.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_warms.label do
      
      f.input :name, :label => Setting.designer_warms.name 
      f.input :phone, :label => Setting.designer_warms.phone 
      f.input :idno, :label => Setting.designer_warms.idno 
      f.input :status, :label => Setting.designer_warms.status 
      f.input :idnumber, :label => Setting.designer_warms.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_warms.label + "信息" do
    attributes_table do
      row "ID" do
        designer_warm.id
      end
      
      row Setting.designer_warms.name do
        designer_warm.name
      end
      row Setting.designer_warms.phone do
        designer_warm.phone
      end
      row Setting.designer_warms.idno do
        designer_warm.idno
      end
      row Setting.designer_warms.status do
        designer_warm.status
      end
      row Setting.designer_warms.idnumber do
        designer_warm.idnumber
      end

      row "创建时间" do
        designer_warm.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_warm.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
