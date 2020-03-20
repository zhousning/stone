ActiveAdmin.register DesignerWarmCert  do

  permit_params  :reg_no, :start, :cert_no, :end, :level, :status, :idnumber

  menu label: Setting.designer_warm_certs.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :reg_no, :label => Setting.designer_warm_certs.reg_no
  filter :start, :label => Setting.designer_warm_certs.start
  filter :cert_no, :label => Setting.designer_warm_certs.cert_no
  filter :end, :label => Setting.designer_warm_certs.end
  filter :level, :label => Setting.designer_warm_certs.level
  filter :status, :label => Setting.designer_warm_certs.status
  filter :idnumber, :label => Setting.designer_warm_certs.idnumber
  filter :created_at

  index :title=>Setting.designer_warm_certs.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_warm_certs.reg_no, :reg_no
    column Setting.designer_warm_certs.start, :start
    column Setting.designer_warm_certs.cert_no, :cert_no
    column Setting.designer_warm_certs.end, :end
    column Setting.designer_warm_certs.level, :level
    column Setting.designer_warm_certs.status, :status
    column Setting.designer_warm_certs.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_warm_certs.label do
      
      f.input :reg_no, :label => Setting.designer_warm_certs.reg_no 
      f.input :start, :label => Setting.designer_warm_certs.start 
      f.input :cert_no, :label => Setting.designer_warm_certs.cert_no 
      f.input :end, :label => Setting.designer_warm_certs.end 
      f.input :level, :label => Setting.designer_warm_certs.level 
      f.input :status, :label => Setting.designer_warm_certs.status 
      f.input :idnumber, :label => Setting.designer_warm_certs.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_warm_certs.label + "信息" do
    attributes_table do
      row "ID" do
        designer_warm_cert.id
      end
      
      row Setting.designer_warm_certs.reg_no do
        designer_warm_cert.reg_no
      end
      row Setting.designer_warm_certs.start do
        designer_warm_cert.start
      end
      row Setting.designer_warm_certs.cert_no do
        designer_warm_cert.cert_no
      end
      row Setting.designer_warm_certs.end do
        designer_warm_cert.end
      end
      row Setting.designer_warm_certs.level do
        designer_warm_cert.level
      end
      row Setting.designer_warm_certs.status do
        designer_warm_cert.status
      end
      row Setting.designer_warm_certs.idnumber do
        designer_warm_cert.idnumber
      end

      row "创建时间" do
        designer_warm_cert.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_warm_cert.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
