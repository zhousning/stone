ActiveAdmin.register LabourHandle  do

  permit_params  :name, :phone, :idno

  menu label: Setting.labour_handles.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.labour_handles.name
  filter :phone, :label => Setting.labour_handles.phone
  filter :idno, :label => Setting.labour_handles.idno
  filter :created_at

  index :title=>Setting.labour_handles.label + "管理" do
    selectable_column
    id_column
    
    column Setting.labour_handles.name, :name
    column Setting.labour_handles.phone, :phone
    column Setting.labour_handles.idno, :idno

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.labour_handles.label do
      
      f.input :name, :label => Setting.labour_handles.name 
      f.input :phone, :label => Setting.labour_handles.phone 
      f.input :idno, :label => Setting.labour_handles.idno 
    end
    f.actions
  end

  show :title=>Setting.labour_handles.label + "信息" do
    attributes_table do
      row "ID" do
        labour_handle.id
      end
      
      row Setting.labour_handles.name do
        labour_handle.name
      end
      row Setting.labour_handles.phone do
        labour_handle.phone
      end
      row Setting.labour_handles.idno do
        labour_handle.idno
      end

      row "创建时间" do
        labour_handle.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        labour_handle.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
