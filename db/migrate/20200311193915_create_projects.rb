class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.string :itemname,  null: false, default: Setting.systems.default_str
    
      t.string :dep_prj,  null: false, default: Setting.systems.default_str
    
      t.string :cstr,  null: false, default: Setting.systems.default_str
    
      t.string :carry,  null: false, default: Setting.systems.default_str
    
      t.string :survey,  null: false, default: Setting.systems.default_str
    
      t.string :design,  null: false, default: Setting.systems.default_str
    
      t.string :control,  null: false, default: Setting.systems.default_str
    
      t.string :detect,  null: false, default: Setting.systems.default_str
    
      t.string :monitor,  null: false, default: Setting.systems.default_str
    
      t.string :domain,  null: false, default: Setting.systems.default_str
    
      t.string :major,  null: false, default: Setting.systems.default_str
    
      t.string :agent,  null: false, default: Setting.systems.default_str
    
      t.string :plan_permit,  null: false, default: Setting.systems.default_str
    
      t.string :carry_permit,  null: false, default: Setting.systems.default_str
    
      t.string :monitor_permit,  null: false, default: Setting.systems.default_str
    
      t.string :cstr_agent,  null: false, default: Setting.systems.default_str
    
      t.string :receive_leader,  null: false, default: Setting.systems.default_str
    
      t.string :receive_operator,  null: false, default: Setting.systems.default_str
    
      t.string :general_supervisor,  null: false, default: Setting.systems.default_str
    
      t.string :prfs_supervisor,  null: false, default: Setting.systems.default_str
    
      t.string :supervisor,  null: false, default: Setting.systems.default_str
    
      t.string :supervising_engineer,  null: false, default: Setting.systems.default_str
    
      t.string :technical_director,  null: false, default: Setting.systems.default_str
    
      t.string :project_manager,  null: false, default: Setting.systems.default_str
    
      t.string :subctr_manager,  null: false, default: Setting.systems.default_str
    
      t.string :cstr_foreman,  null: false, default: Setting.systems.default_str
    
      t.string :constructors,  null: false, default: Setting.systems.default_str
    
      t.string :quality_worker,  null: false, default: Setting.systems.default_str
    
      t.string :inspector,  null: false, default: Setting.systems.default_str
    
      t.string :test_person,  null: false, default: Setting.systems.default_str
    
      t.string :detect_person,  null: false, default: Setting.systems.default_str
    
      t.string :auditor,  null: false, default: Setting.systems.default_str
    
      t.string :reviewer,  null: false, default: Setting.systems.default_str
    
      t.string :tester,  null: false, default: Setting.systems.default_str
    
      t.string :issuer,  null: false, default: Setting.systems.default_str
    
      t.string :examiner,  null: false, default: Setting.systems.default_str
    
      t.string :calculator,  null: false, default: Setting.systems.default_str
    
      t.string :recorder,  null: false, default: Setting.systems.default_str
    
      t.string :surveyor,  null: false, default: Setting.systems.default_str
    
      t.string :filler,  null: false, default: Setting.systems.default_str
    
      t.string :operator,  null: false, default: Setting.systems.default_str
    
      t.string :equipment,  null: false, default: Setting.systems.default_str
    
      t.string :address,  null: false, default: Setting.systems.default_str
    
      t.string :structor,  null: false, default: Setting.systems.default_str
    
      t.string :layer_number,  null: false, default: Setting.systems.default_str
    
      t.string :prj_category,  null: false, default: Setting.systems.default_str
    
      t.string :prj_scale,  null: false, default: Setting.systems.default_str
    
      t.string :start,  null: false, default: Setting.systems.default_str
    
      t.string :end,  null: false, default: Setting.systems.default_str
    
      t.string :review_unit,  null: false, default: Setting.systems.default_str
    
      t.string :review_permission,  null: false, default: Setting.systems.default_str
    
      t.string :measure_cert,  null: false, default: Setting.systems.default_str
    
      t.string :supervision_no,  null: false, default: Setting.systems.default_str
    
      t.string :quality_info,  null: false, default: Setting.systems.default_str
    
      t.string :regist_no,  null: false, default: Setting.systems.default_str
    
      t.string :prj_designer,  null: false, default: Setting.systems.default_str
    
      t.string :geo_prospect,  null: false, default: Setting.systems.default_str
    
      t.string :prj_manager,  null: false, default: Setting.systems.default_str
    
      t.string :status,  null: false, default: Setting.systems.opening
    
      t.integer :creator
    
      t.references :project_group
    

      t.timestamps null: false
    end
  end
end
