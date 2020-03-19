ActiveAdmin.register MonitorHandle  do

  permit_params  :name, :idno, :cpt_job, :prj_job

  menu label: Setting.monitor_handles.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.monitor_handles.name
  filter :idno, :label => Setting.monitor_handles.idno
  filter :cpt_job, :label => Setting.monitor_handles.cpt_job
  filter :prj_job, :label => Setting.monitor_handles.prj_job
  filter :created_at

  index :title=>Setting.monitor_handles.label + "管理" do
    selectable_column
    id_column
    
    column Setting.monitor_handles.name, :name
    column Setting.monitor_handles.idno, :idno
    column Setting.monitor_handles.cpt_job, :cpt_job
    column Setting.monitor_handles.prj_job, :prj_job

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.monitor_handles.label do
      
      f.input :name, :label => Setting.monitor_handles.name 
      f.input :idno, :label => Setting.monitor_handles.idno 
      f.input :cpt_job, :label => Setting.monitor_handles.cpt_job 
      f.input :prj_job, :label => Setting.monitor_handles.prj_job 
    end
    f.actions
  end

  show :title=>Setting.monitor_handles.label + "信息" do
    attributes_table do
      row "ID" do
        monitor_handle.id
      end
      
      row Setting.monitor_handles.name do
        monitor_handle.name
      end
      row Setting.monitor_handles.idno do
        monitor_handle.idno
      end
      row Setting.monitor_handles.cpt_job do
        monitor_handle.cpt_job
      end
      row Setting.monitor_handles.prj_job do
        monitor_handle.prj_job
      end

      row "创建时间" do
        monitor_handle.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        monitor_handle.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
