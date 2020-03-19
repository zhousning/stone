ActiveAdmin.register ProspectorHandle  do

  permit_params  :name, :idno, :cpt_job, :prj_job

  menu label: Setting.prospector_handles.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.prospector_handles.name
  filter :idno, :label => Setting.prospector_handles.idno
  filter :cpt_job, :label => Setting.prospector_handles.cpt_job
  filter :prj_job, :label => Setting.prospector_handles.prj_job
  filter :created_at

  index :title=>Setting.prospector_handles.label + "管理" do
    selectable_column
    id_column
    
    column Setting.prospector_handles.name, :name
    column Setting.prospector_handles.idno, :idno
    column Setting.prospector_handles.cpt_job, :cpt_job
    column Setting.prospector_handles.prj_job, :prj_job

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.prospector_handles.label do
      
      f.input :name, :label => Setting.prospector_handles.name 
      f.input :idno, :label => Setting.prospector_handles.idno 
      f.input :cpt_job, :label => Setting.prospector_handles.cpt_job 
      f.input :prj_job, :label => Setting.prospector_handles.prj_job 
    end
    f.actions
  end

  show :title=>Setting.prospector_handles.label + "信息" do
    attributes_table do
      row "ID" do
        prospector_handle.id
      end
      
      row Setting.prospector_handles.name do
        prospector_handle.name
      end
      row Setting.prospector_handles.idno do
        prospector_handle.idno
      end
      row Setting.prospector_handles.cpt_job do
        prospector_handle.cpt_job
      end
      row Setting.prospector_handles.prj_job do
        prospector_handle.prj_job
      end

      row "创建时间" do
        prospector_handle.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        prospector_handle.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
