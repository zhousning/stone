ActiveAdmin.register SupervisorWorkerCert  do

  permit_params  :reg_no, :start, :cert_no, :end, :level, :status, :idnumber

  menu label: Setting.supervisor_worker_certs.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :reg_no, :label => Setting.supervisor_worker_certs.reg_no
  filter :start, :label => Setting.supervisor_worker_certs.start
  filter :cert_no, :label => Setting.supervisor_worker_certs.cert_no
  filter :end, :label => Setting.supervisor_worker_certs.end
  filter :level, :label => Setting.supervisor_worker_certs.level
  filter :status, :label => Setting.supervisor_worker_certs.status
  filter :idnumber, :label => Setting.supervisor_worker_certs.idnumber
  filter :created_at

  index :title=>Setting.supervisor_worker_certs.label + "管理" do
    selectable_column
    id_column
    
    column Setting.supervisor_worker_certs.reg_no, :reg_no
    column Setting.supervisor_worker_certs.start, :start
    column Setting.supervisor_worker_certs.cert_no, :cert_no
    column Setting.supervisor_worker_certs.end, :end
    column Setting.supervisor_worker_certs.level, :level
    column Setting.supervisor_worker_certs.status, :status
    column Setting.supervisor_worker_certs.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.supervisor_worker_certs.label do
      
      f.input :reg_no, :label => Setting.supervisor_worker_certs.reg_no 
      f.input :start, :label => Setting.supervisor_worker_certs.start 
      f.input :cert_no, :label => Setting.supervisor_worker_certs.cert_no 
      f.input :end, :label => Setting.supervisor_worker_certs.end 
      f.input :level, :label => Setting.supervisor_worker_certs.level 
      f.input :status, :label => Setting.supervisor_worker_certs.status 
      f.input :idnumber, :label => Setting.supervisor_worker_certs.idnumber 
    end
    f.actions
  end

  show :title=>Setting.supervisor_worker_certs.label + "信息" do
    attributes_table do
      row "ID" do
        supervisor_worker_cert.id
      end
      
      row Setting.supervisor_worker_certs.reg_no do
        supervisor_worker_cert.reg_no
      end
      row Setting.supervisor_worker_certs.start do
        supervisor_worker_cert.start
      end
      row Setting.supervisor_worker_certs.cert_no do
        supervisor_worker_cert.cert_no
      end
      row Setting.supervisor_worker_certs.end do
        supervisor_worker_cert.end
      end
      row Setting.supervisor_worker_certs.level do
        supervisor_worker_cert.level
      end
      row Setting.supervisor_worker_certs.status do
        supervisor_worker_cert.status
      end
      row Setting.supervisor_worker_certs.idnumber do
        supervisor_worker_cert.idnumber
      end

      row "创建时间" do
        supervisor_worker_cert.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        supervisor_worker_cert.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
