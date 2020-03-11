ActiveAdmin.register Project  do

  permit_params  :name, :itemname, :dep_prj, :cstr, :carry, :survey, :design, :control, :detect, :monitor, :domain, :major, :agent, :plan_permit, :carry_permit, :monitor_permit, :cstr_agent, :receive_leader, :receive_operator, :general_supervisor, :prfs_supervisor, :supervisor, :supervising_engineer, :technical_director, :project_manager, :subctr_manager, :cstr_foreman, :constructors, :quality_worker, :inspector, :test_person, :detect_person, :auditor, :reviewer, :tester, :issuer, :examiner, :calculator, :recorder, :surveyor, :filler, :operator, :equipment, :address, :structor, :layer_number, :prj_category, :prj_scale, :start, :end, :review_unit, :review_permission, :measure_cert, :supervision_no, :quality_info, :regist_no, :prj_designer, :geo_prospect, :prj_manager, :status

  menu label: Setting.projects.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :name, :label => Setting.projects.name
  filter :itemname, :label => Setting.projects.itemname
  filter :dep_prj, :label => Setting.projects.dep_prj
  filter :cstr, :label => Setting.projects.cstr
  filter :carry, :label => Setting.projects.carry
  filter :survey, :label => Setting.projects.survey
  filter :design, :label => Setting.projects.design
  filter :control, :label => Setting.projects.control
  filter :detect, :label => Setting.projects.detect
  filter :monitor, :label => Setting.projects.monitor
  filter :domain, :label => Setting.projects.domain
  filter :major, :label => Setting.projects.major
  filter :agent, :label => Setting.projects.agent
  filter :plan_permit, :label => Setting.projects.plan_permit
  filter :carry_permit, :label => Setting.projects.carry_permit
  filter :monitor_permit, :label => Setting.projects.monitor_permit
  filter :cstr_agent, :label => Setting.projects.cstr_agent
  filter :receive_leader, :label => Setting.projects.receive_leader
  filter :receive_operator, :label => Setting.projects.receive_operator
  filter :general_supervisor, :label => Setting.projects.general_supervisor
  filter :prfs_supervisor, :label => Setting.projects.prfs_supervisor
  filter :supervisor, :label => Setting.projects.supervisor
  filter :supervising_engineer, :label => Setting.projects.supervising_engineer
  filter :technical_director, :label => Setting.projects.technical_director
  filter :project_manager, :label => Setting.projects.project_manager
  filter :subctr_manager, :label => Setting.projects.subctr_manager
  filter :cstr_foreman, :label => Setting.projects.cstr_foreman
  filter :constructors, :label => Setting.projects.constructors
  filter :quality_worker, :label => Setting.projects.quality_worker
  filter :inspector, :label => Setting.projects.inspector
  filter :test_person, :label => Setting.projects.test_person
  filter :detect_person, :label => Setting.projects.detect_person
  filter :auditor, :label => Setting.projects.auditor
  filter :reviewer, :label => Setting.projects.reviewer
  filter :tester, :label => Setting.projects.tester
  filter :issuer, :label => Setting.projects.issuer
  filter :examiner, :label => Setting.projects.examiner
  filter :calculator, :label => Setting.projects.calculator
  filter :recorder, :label => Setting.projects.recorder
  filter :surveyor, :label => Setting.projects.surveyor
  filter :filler, :label => Setting.projects.filler
  filter :operator, :label => Setting.projects.operator
  filter :equipment, :label => Setting.projects.equipment
  filter :address, :label => Setting.projects.address
  filter :structor, :label => Setting.projects.structor
  filter :layer_number, :label => Setting.projects.layer_number
  filter :prj_category, :label => Setting.projects.prj_category
  filter :prj_scale, :label => Setting.projects.prj_scale
  filter :start, :label => Setting.projects.start
  filter :end, :label => Setting.projects.end
  filter :review_unit, :label => Setting.projects.review_unit
  filter :review_permission, :label => Setting.projects.review_permission
  filter :measure_cert, :label => Setting.projects.measure_cert
  filter :supervision_no, :label => Setting.projects.supervision_no
  filter :quality_info, :label => Setting.projects.quality_info
  filter :regist_no, :label => Setting.projects.regist_no
  filter :prj_designer, :label => Setting.projects.prj_designer
  filter :geo_prospect, :label => Setting.projects.geo_prospect
  filter :prj_manager, :label => Setting.projects.prj_manager
  filter :status, :label => Setting.projects.status
  filter :created_at

  index :title=>Setting.projects.label + "管理" do
    selectable_column
    id_column
    
    column Setting.projects.name, :name
    column Setting.projects.itemname, :itemname
    column Setting.projects.dep_prj, :dep_prj
    column Setting.projects.cstr, :cstr
    column Setting.projects.carry, :carry
    column Setting.projects.survey, :survey
    column Setting.projects.design, :design
    column Setting.projects.control, :control
    column Setting.projects.detect, :detect
    column Setting.projects.monitor, :monitor
    column Setting.projects.domain, :domain
    column Setting.projects.major, :major
    column Setting.projects.agent, :agent
    column Setting.projects.plan_permit, :plan_permit
    column Setting.projects.carry_permit, :carry_permit
    column Setting.projects.monitor_permit, :monitor_permit
    column Setting.projects.cstr_agent, :cstr_agent
    column Setting.projects.receive_leader, :receive_leader
    column Setting.projects.receive_operator, :receive_operator
    column Setting.projects.general_supervisor, :general_supervisor
    column Setting.projects.prfs_supervisor, :prfs_supervisor
    column Setting.projects.supervisor, :supervisor
    column Setting.projects.supervising_engineer, :supervising_engineer
    column Setting.projects.technical_director, :technical_director
    column Setting.projects.project_manager, :project_manager
    column Setting.projects.subctr_manager, :subctr_manager
    column Setting.projects.cstr_foreman, :cstr_foreman
    column Setting.projects.constructors, :constructors
    column Setting.projects.quality_worker, :quality_worker
    column Setting.projects.inspector, :inspector
    column Setting.projects.test_person, :test_person
    column Setting.projects.detect_person, :detect_person
    column Setting.projects.auditor, :auditor
    column Setting.projects.reviewer, :reviewer
    column Setting.projects.tester, :tester
    column Setting.projects.issuer, :issuer
    column Setting.projects.examiner, :examiner
    column Setting.projects.calculator, :calculator
    column Setting.projects.recorder, :recorder
    column Setting.projects.surveyor, :surveyor
    column Setting.projects.filler, :filler
    column Setting.projects.operator, :operator
    column Setting.projects.equipment, :equipment
    column Setting.projects.address, :address
    column Setting.projects.structor, :structor
    column Setting.projects.layer_number, :layer_number
    column Setting.projects.prj_category, :prj_category
    column Setting.projects.prj_scale, :prj_scale
    column Setting.projects.start, :start
    column Setting.projects.end, :end
    column Setting.projects.review_unit, :review_unit
    column Setting.projects.review_permission, :review_permission
    column Setting.projects.measure_cert, :measure_cert
    column Setting.projects.supervision_no, :supervision_no
    column Setting.projects.quality_info, :quality_info
    column Setting.projects.regist_no, :regist_no
    column Setting.projects.prj_designer, :prj_designer
    column Setting.projects.geo_prospect, :geo_prospect
    column Setting.projects.prj_manager, :prj_manager
    column Setting.projects.status, :status

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.projects.label do
      
      f.input :name, :label => Setting.projects.name 
      f.input :itemname, :label => Setting.projects.itemname 
      f.input :dep_prj, :label => Setting.projects.dep_prj 
      f.input :cstr, :label => Setting.projects.cstr 
      f.input :carry, :label => Setting.projects.carry 
      f.input :survey, :label => Setting.projects.survey 
      f.input :design, :label => Setting.projects.design 
      f.input :control, :label => Setting.projects.control 
      f.input :detect, :label => Setting.projects.detect 
      f.input :monitor, :label => Setting.projects.monitor 
      f.input :domain, :label => Setting.projects.domain 
      f.input :major, :label => Setting.projects.major 
      f.input :agent, :label => Setting.projects.agent 
      f.input :plan_permit, :label => Setting.projects.plan_permit 
      f.input :carry_permit, :label => Setting.projects.carry_permit 
      f.input :monitor_permit, :label => Setting.projects.monitor_permit 
      f.input :cstr_agent, :label => Setting.projects.cstr_agent 
      f.input :receive_leader, :label => Setting.projects.receive_leader 
      f.input :receive_operator, :label => Setting.projects.receive_operator 
      f.input :general_supervisor, :label => Setting.projects.general_supervisor 
      f.input :prfs_supervisor, :label => Setting.projects.prfs_supervisor 
      f.input :supervisor, :label => Setting.projects.supervisor 
      f.input :supervising_engineer, :label => Setting.projects.supervising_engineer 
      f.input :technical_director, :label => Setting.projects.technical_director 
      f.input :project_manager, :label => Setting.projects.project_manager 
      f.input :subctr_manager, :label => Setting.projects.subctr_manager 
      f.input :cstr_foreman, :label => Setting.projects.cstr_foreman 
      f.input :constructors, :label => Setting.projects.constructors 
      f.input :quality_worker, :label => Setting.projects.quality_worker 
      f.input :inspector, :label => Setting.projects.inspector 
      f.input :test_person, :label => Setting.projects.test_person 
      f.input :detect_person, :label => Setting.projects.detect_person 
      f.input :auditor, :label => Setting.projects.auditor 
      f.input :reviewer, :label => Setting.projects.reviewer 
      f.input :tester, :label => Setting.projects.tester 
      f.input :issuer, :label => Setting.projects.issuer 
      f.input :examiner, :label => Setting.projects.examiner 
      f.input :calculator, :label => Setting.projects.calculator 
      f.input :recorder, :label => Setting.projects.recorder 
      f.input :surveyor, :label => Setting.projects.surveyor 
      f.input :filler, :label => Setting.projects.filler 
      f.input :operator, :label => Setting.projects.operator 
      f.input :equipment, :label => Setting.projects.equipment 
      f.input :address, :label => Setting.projects.address 
      f.input :structor, :label => Setting.projects.structor 
      f.input :layer_number, :label => Setting.projects.layer_number 
      f.input :prj_category, :label => Setting.projects.prj_category 
      f.input :prj_scale, :label => Setting.projects.prj_scale 
      f.input :start, :label => Setting.projects.start 
      f.input :end, :label => Setting.projects.end 
      f.input :review_unit, :label => Setting.projects.review_unit 
      f.input :review_permission, :label => Setting.projects.review_permission 
      f.input :measure_cert, :label => Setting.projects.measure_cert 
      f.input :supervision_no, :label => Setting.projects.supervision_no 
      f.input :quality_info, :label => Setting.projects.quality_info 
      f.input :regist_no, :label => Setting.projects.regist_no 
      f.input :prj_designer, :label => Setting.projects.prj_designer 
      f.input :geo_prospect, :label => Setting.projects.geo_prospect 
      f.input :prj_manager, :label => Setting.projects.prj_manager 
      f.input :status, :label => Setting.projects.status 
    end
    f.actions
  end

  show :title=>Setting.projects.label + "信息" do
    attributes_table do
      row "ID" do
        project.id
      end
      
      row Setting.projects.name do
        project.name
      end
      row Setting.projects.itemname do
        project.itemname
      end
      row Setting.projects.dep_prj do
        project.dep_prj
      end
      row Setting.projects.cstr do
        project.cstr
      end
      row Setting.projects.carry do
        project.carry
      end
      row Setting.projects.survey do
        project.survey
      end
      row Setting.projects.design do
        project.design
      end
      row Setting.projects.control do
        project.control
      end
      row Setting.projects.detect do
        project.detect
      end
      row Setting.projects.monitor do
        project.monitor
      end
      row Setting.projects.domain do
        project.domain
      end
      row Setting.projects.major do
        project.major
      end
      row Setting.projects.agent do
        project.agent
      end
      row Setting.projects.plan_permit do
        project.plan_permit
      end
      row Setting.projects.carry_permit do
        project.carry_permit
      end
      row Setting.projects.monitor_permit do
        project.monitor_permit
      end
      row Setting.projects.cstr_agent do
        project.cstr_agent
      end
      row Setting.projects.receive_leader do
        project.receive_leader
      end
      row Setting.projects.receive_operator do
        project.receive_operator
      end
      row Setting.projects.general_supervisor do
        project.general_supervisor
      end
      row Setting.projects.prfs_supervisor do
        project.prfs_supervisor
      end
      row Setting.projects.supervisor do
        project.supervisor
      end
      row Setting.projects.supervising_engineer do
        project.supervising_engineer
      end
      row Setting.projects.technical_director do
        project.technical_director
      end
      row Setting.projects.project_manager do
        project.project_manager
      end
      row Setting.projects.subctr_manager do
        project.subctr_manager
      end
      row Setting.projects.cstr_foreman do
        project.cstr_foreman
      end
      row Setting.projects.constructors do
        project.constructors
      end
      row Setting.projects.quality_worker do
        project.quality_worker
      end
      row Setting.projects.inspector do
        project.inspector
      end
      row Setting.projects.test_person do
        project.test_person
      end
      row Setting.projects.detect_person do
        project.detect_person
      end
      row Setting.projects.auditor do
        project.auditor
      end
      row Setting.projects.reviewer do
        project.reviewer
      end
      row Setting.projects.tester do
        project.tester
      end
      row Setting.projects.issuer do
        project.issuer
      end
      row Setting.projects.examiner do
        project.examiner
      end
      row Setting.projects.calculator do
        project.calculator
      end
      row Setting.projects.recorder do
        project.recorder
      end
      row Setting.projects.surveyor do
        project.surveyor
      end
      row Setting.projects.filler do
        project.filler
      end
      row Setting.projects.operator do
        project.operator
      end
      row Setting.projects.equipment do
        project.equipment
      end
      row Setting.projects.address do
        project.address
      end
      row Setting.projects.structor do
        project.structor
      end
      row Setting.projects.layer_number do
        project.layer_number
      end
      row Setting.projects.prj_category do
        project.prj_category
      end
      row Setting.projects.prj_scale do
        project.prj_scale
      end
      row Setting.projects.start do
        project.start
      end
      row Setting.projects.end do
        project.end
      end
      row Setting.projects.review_unit do
        project.review_unit
      end
      row Setting.projects.review_permission do
        project.review_permission
      end
      row Setting.projects.measure_cert do
        project.measure_cert
      end
      row Setting.projects.supervision_no do
        project.supervision_no
      end
      row Setting.projects.quality_info do
        project.quality_info
      end
      row Setting.projects.regist_no do
        project.regist_no
      end
      row Setting.projects.prj_designer do
        project.prj_designer
      end
      row Setting.projects.geo_prospect do
        project.geo_prospect
      end
      row Setting.projects.prj_manager do
        project.prj_manager
      end
      row Setting.projects.status do
        project.status
      end

      row "创建时间" do
        project.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        project.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
