ActiveAdmin.register SupervisorWorker  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.supervisor_workers.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.supervisor_workers.name
  filter :phone, :label => Setting.supervisor_workers.phone
  filter :idno, :label => Setting.supervisor_workers.idno
  filter :status, :label => Setting.supervisor_workers.status
  filter :idnumber, :label => Setting.supervisor_workers.idnumber
  filter :created_at

  index :title=>Setting.supervisor_workers.label + "管理" do
    selectable_column
    id_column
    
    column Setting.supervisor_workers.name, :name
    column Setting.supervisor_workers.phone, :phone
    column Setting.supervisor_workers.idno, :idno
    column Setting.supervisor_workers.status, :status
    column Setting.supervisor_workers.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.supervisor_workers.label do
      
      f.input :name, :label => Setting.supervisor_workers.name 
      f.input :phone, :label => Setting.supervisor_workers.phone 
      f.input :idno, :label => Setting.supervisor_workers.idno 
      f.input :status, :label => Setting.supervisor_workers.status 
      f.input :idnumber, :label => Setting.supervisor_workers.idnumber 
    end
    f.actions
  end

  show :title=>Setting.supervisor_workers.label + "信息" do
    attributes_table do
      row "ID" do
        supervisor_worker.id
      end
      
      row Setting.supervisor_workers.name do
        supervisor_worker.name
      end
      row Setting.supervisor_workers.phone do
        supervisor_worker.phone
      end
      row Setting.supervisor_workers.idno do
        supervisor_worker.idno
      end
      row Setting.supervisor_workers.status do
        supervisor_worker.status
      end
      row Setting.supervisor_workers.idnumber do
        supervisor_worker.idnumber
      end

      row "创建时间" do
        supervisor_worker.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        supervisor_worker.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
