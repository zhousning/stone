ActiveAdmin.register SupervisorState  do

  permit_params  :name, :phone, :idno, :status, :idnumber

  menu label: Setting.supervisor_states.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.supervisor_states.name
  filter :phone, :label => Setting.supervisor_states.phone
  filter :idno, :label => Setting.supervisor_states.idno
  filter :status, :label => Setting.supervisor_states.status
  filter :idnumber, :label => Setting.supervisor_states.idnumber
  filter :created_at

  index :title=>Setting.supervisor_states.label + "管理" do
    selectable_column
    id_column
    
    column Setting.supervisor_states.name, :name
    column Setting.supervisor_states.phone, :phone
    column Setting.supervisor_states.idno, :idno
    column Setting.supervisor_states.status, :status
    column Setting.supervisor_states.idnumber, :idnumber

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.supervisor_states.label do
      
      f.input :name, :label => Setting.supervisor_states.name 
      f.input :phone, :label => Setting.supervisor_states.phone 
      f.input :idno, :label => Setting.supervisor_states.idno 
      f.input :status, :label => Setting.supervisor_states.status 
      f.input :idnumber, :label => Setting.supervisor_states.idnumber 
    end
    f.actions
  end

  show :title=>Setting.supervisor_states.label + "信息" do
    attributes_table do
      row "ID" do
        supervisor_state.id
      end
      
      row Setting.supervisor_states.name do
        supervisor_state.name
      end
      row Setting.supervisor_states.phone do
        supervisor_state.phone
      end
      row Setting.supervisor_states.idno do
        supervisor_state.idno
      end
      row Setting.supervisor_states.status do
        supervisor_state.status
      end
      row Setting.supervisor_states.idnumber do
        supervisor_state.idnumber
      end

      row "创建时间" do
        supervisor_state.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        supervisor_state.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
