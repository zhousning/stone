ActiveAdmin.register DesignerElectric  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.designer_electrics.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.designer_electrics.name
  filter :phone, :label => Setting.designer_electrics.phone
  filter :idno, :label => Setting.designer_electrics.idno
  filter :status, :label => Setting.designer_electrics.status
  filter :idnumber, :label => Setting.designer_electrics.idnumber
  filter :created_at

  index :title=>Setting.designer_electrics.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_electrics.name, :name
    column Setting.designer_electrics.phone, :phone
    column Setting.designer_electrics.idno, :idno
    column Setting.designer_electrics.status, :status
    column Setting.designer_electrics.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_electrics.label do
      
      f.input :name, :label => Setting.designer_electrics.name 
      f.input :phone, :label => Setting.designer_electrics.phone 
      f.input :idno, :label => Setting.designer_electrics.idno 
      f.input :status, :label => Setting.designer_electrics.status 
      f.input :idnumber, :label => Setting.designer_electrics.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_electrics.label + "信息" do
    attributes_table do
      row "ID" do
        designer_electric.id
      end
      
      row Setting.designer_electrics.name do
        designer_electric.name
      end
      row Setting.designer_electrics.phone do
        designer_electric.phone
      end
      row Setting.designer_electrics.idno do
        designer_electric.idno
      end
      row Setting.designer_electrics.status do
        designer_electric.status
      end
      row Setting.designer_electrics.idnumber do
        designer_electric.idnumber
      end

      row "创建时间" do
        designer_electric.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_electric.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
