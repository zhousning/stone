ActiveAdmin.register SupervisorTarget  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.supervisor_targets.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.supervisor_targets.name
  filter :phone, :label => Setting.supervisor_targets.phone
  filter :idno, :label => Setting.supervisor_targets.idno
  filter :status, :label => Setting.supervisor_targets.status
  filter :idnumber, :label => Setting.supervisor_targets.idnumber
  filter :created_at

  index :title=>Setting.supervisor_targets.label + "管理" do
    selectable_column
    id_column
    
    column Setting.supervisor_targets.name, :name
    column Setting.supervisor_targets.phone, :phone
    column Setting.supervisor_targets.idno, :idno
    column Setting.supervisor_targets.status, :status
    column Setting.supervisor_targets.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.supervisor_targets.label do
      
      f.input :name, :label => Setting.supervisor_targets.name 
      f.input :phone, :label => Setting.supervisor_targets.phone 
      f.input :idno, :label => Setting.supervisor_targets.idno 
      f.input :status, :label => Setting.supervisor_targets.status 
      f.input :idnumber, :label => Setting.supervisor_targets.idnumber 
    end
    f.actions
  end

  show :title=>Setting.supervisor_targets.label + "信息" do
    attributes_table do
      row "ID" do
        supervisor_target.id
      end
      
      row Setting.supervisor_targets.name do
        supervisor_target.name
      end
      row Setting.supervisor_targets.phone do
        supervisor_target.phone
      end
      row Setting.supervisor_targets.idno do
        supervisor_target.idno
      end
      row Setting.supervisor_targets.status do
        supervisor_target.status
      end
      row Setting.supervisor_targets.idnumber do
        supervisor_target.idnumber
      end

      row "创建时间" do
        supervisor_target.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        supervisor_target.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
