ActiveAdmin.register HandleCert  do

  permit_params  :reg_no, :cert_no, :start, :end, :dept, :level

  menu label: Setting.handle_certs.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :reg_no, :label => Setting.handle_certs.reg_no
  filter :cert_no, :label => Setting.handle_certs.cert_no
  filter :start, :label => Setting.handle_certs.start
  filter :end, :label => Setting.handle_certs.end
  filter :dept, :label => Setting.handle_certs.dept
  filter :level, :label => Setting.handle_certs.level
  filter :created_at

  index :title=>Setting.handle_certs.label + "管理" do
    selectable_column
    id_column
    
    column Setting.handle_certs.reg_no, :reg_no
    column Setting.handle_certs.cert_no, :cert_no
    column Setting.handle_certs.start, :start
    column Setting.handle_certs.end, :end
    column Setting.handle_certs.dept, :dept
    column Setting.handle_certs.level, :level

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.handle_certs.label do
      
      f.input :reg_no, :label => Setting.handle_certs.reg_no 
      f.input :cert_no, :label => Setting.handle_certs.cert_no 
      f.input :start, :label => Setting.handle_certs.start 
      f.input :end, :label => Setting.handle_certs.end 
      f.input :dept, :label => Setting.handle_certs.dept 
      f.input :level, :label => Setting.handle_certs.level 
    end
    f.actions
  end

  show :title=>Setting.handle_certs.label + "信息" do
    attributes_table do
      row "ID" do
        handle_cert.id
      end
      
      row Setting.handle_certs.reg_no do
        handle_cert.reg_no
      end
      row Setting.handle_certs.cert_no do
        handle_cert.cert_no
      end
      row Setting.handle_certs.start do
        handle_cert.start
      end
      row Setting.handle_certs.end do
        handle_cert.end
      end
      row Setting.handle_certs.dept do
        handle_cert.dept
      end
      row Setting.handle_certs.level do
        handle_cert.level
      end

      row "创建时间" do
        handle_cert.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        handle_cert.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
