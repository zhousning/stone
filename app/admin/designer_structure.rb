ActiveAdmin.register DesignerStructure  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.designer_structures.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.designer_structures.name
  filter :phone, :label => Setting.designer_structures.phone
  filter :idno, :label => Setting.designer_structures.idno
  filter :status, :label => Setting.designer_structures.status
  filter :idnumber, :label => Setting.designer_structures.idnumber
  filter :created_at

  index :title=>Setting.designer_structures.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_structures.name, :name
    column Setting.designer_structures.phone, :phone
    column Setting.designer_structures.idno, :idno
    column Setting.designer_structures.status, :status
    column Setting.designer_structures.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_structures.label do
      
      f.input :name, :label => Setting.designer_structures.name 
      f.input :phone, :label => Setting.designer_structures.phone 
      f.input :idno, :label => Setting.designer_structures.idno 
      f.input :status, :label => Setting.designer_structures.status 
      f.input :idnumber, :label => Setting.designer_structures.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_structures.label + "信息" do
    attributes_table do
      row "ID" do
        designer_structure.id
      end
      
      row Setting.designer_structures.name do
        designer_structure.name
      end
      row Setting.designer_structures.phone do
        designer_structure.phone
      end
      row Setting.designer_structures.idno do
        designer_structure.idno
      end
      row Setting.designer_structures.status do
        designer_structure.status
      end
      row Setting.designer_structures.idnumber do
        designer_structure.idnumber
      end

      row "创建时间" do
        designer_structure.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_structure.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
