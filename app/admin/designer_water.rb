ActiveAdmin.register DesignerWater  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.designer_waters.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.designer_waters.name
  filter :phone, :label => Setting.designer_waters.phone
  filter :idno, :label => Setting.designer_waters.idno
  filter :status, :label => Setting.designer_waters.status
  filter :idnumber, :label => Setting.designer_waters.idnumber
  filter :created_at

  index :title=>Setting.designer_waters.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_waters.name, :name
    column Setting.designer_waters.phone, :phone
    column Setting.designer_waters.idno, :idno
    column Setting.designer_waters.status, :status
    column Setting.designer_waters.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_waters.label do
      
      f.input :name, :label => Setting.designer_waters.name 
      f.input :phone, :label => Setting.designer_waters.phone 
      f.input :idno, :label => Setting.designer_waters.idno 
      f.input :status, :label => Setting.designer_waters.status 
      f.input :idnumber, :label => Setting.designer_waters.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_waters.label + "信息" do
    attributes_table do
      row "ID" do
        designer_water.id
      end
      
      row Setting.designer_waters.name do
        designer_water.name
      end
      row Setting.designer_waters.phone do
        designer_water.phone
      end
      row Setting.designer_waters.idno do
        designer_water.idno
      end
      row Setting.designer_waters.status do
        designer_water.status
      end
      row Setting.designer_waters.idnumber do
        designer_water.idnumber
      end

      row "创建时间" do
        designer_water.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_water.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
