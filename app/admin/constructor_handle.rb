ActiveAdmin.register ConstructorHandle  do

  permit_params  :name, :idno, :cpt_job, :prj_job

  menu label: Setting.constructor_handles.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.constructor_handles.name
  filter :idno, :label => Setting.constructor_handles.idno
  filter :cpt_job, :label => Setting.constructor_handles.cpt_job
  filter :prj_job, :label => Setting.constructor_handles.prj_job
  filter :created_at

  index :title=>Setting.constructor_handles.label + "管理" do
    selectable_column
    id_column
    
    column Setting.constructor_handles.name, :name
    column Setting.constructor_handles.idno, :idno
    column Setting.constructor_handles.cpt_job, :cpt_job
    column Setting.constructor_handles.prj_job, :prj_job

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.constructor_handles.label do
      
      f.input :name, :label => Setting.constructor_handles.name 
      f.input :idno, :label => Setting.constructor_handles.idno 
      f.input :cpt_job, :label => Setting.constructor_handles.cpt_job 
      f.input :prj_job, :label => Setting.constructor_handles.prj_job 
    end
    f.actions
  end

  show :title=>Setting.constructor_handles.label + "信息" do
    attributes_table do
      row "ID" do
        constructor_handle.id
      end
      
      row Setting.constructor_handles.name do
        constructor_handle.name
      end
      row Setting.constructor_handles.idno do
        constructor_handle.idno
      end
      row Setting.constructor_handles.cpt_job do
        constructor_handle.cpt_job
      end
      row Setting.constructor_handles.prj_job do
        constructor_handle.prj_job
      end

      row "创建时间" do
        constructor_handle.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        constructor_handle.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
