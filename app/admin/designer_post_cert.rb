ActiveAdmin.register DesignerPostCert  do

  permit_params  :reg_no, :start, :cert_no, :end, :level, :status, :idnumber

  menu label: Setting.designer_post_certs.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :reg_no, :label => Setting.designer_post_certs.reg_no
  filter :start, :label => Setting.designer_post_certs.start
  filter :cert_no, :label => Setting.designer_post_certs.cert_no
  filter :end, :label => Setting.designer_post_certs.end
  filter :level, :label => Setting.designer_post_certs.level
  filter :status, :label => Setting.designer_post_certs.status
  filter :idnumber, :label => Setting.designer_post_certs.idnumber
  filter :created_at

  index :title=>Setting.designer_post_certs.label + "管理" do
    selectable_column
    id_column
    
    column Setting.designer_post_certs.reg_no, :reg_no
    column Setting.designer_post_certs.start, :start
    column Setting.designer_post_certs.cert_no, :cert_no
    column Setting.designer_post_certs.end, :end
    column Setting.designer_post_certs.level, :level
    column Setting.designer_post_certs.status, :status
    column Setting.designer_post_certs.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.designer_post_certs.label do
      
      f.input :reg_no, :label => Setting.designer_post_certs.reg_no 
      f.input :start, :label => Setting.designer_post_certs.start 
      f.input :cert_no, :label => Setting.designer_post_certs.cert_no 
      f.input :end, :label => Setting.designer_post_certs.end 
      f.input :level, :label => Setting.designer_post_certs.level 
      f.input :status, :label => Setting.designer_post_certs.status 
      f.input :idnumber, :label => Setting.designer_post_certs.idnumber 
    end
    f.actions
  end

  show :title=>Setting.designer_post_certs.label + "信息" do
    attributes_table do
      row "ID" do
        designer_post_cert.id
      end
      
      row Setting.designer_post_certs.reg_no do
        designer_post_cert.reg_no
      end
      row Setting.designer_post_certs.start do
        designer_post_cert.start
      end
      row Setting.designer_post_certs.cert_no do
        designer_post_cert.cert_no
      end
      row Setting.designer_post_certs.end do
        designer_post_cert.end
      end
      row Setting.designer_post_certs.level do
        designer_post_cert.level
      end
      row Setting.designer_post_certs.status do
        designer_post_cert.status
      end
      row Setting.designer_post_certs.idnumber do
        designer_post_cert.idnumber
      end

      row "创建时间" do
        designer_post_cert.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        designer_post_cert.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
