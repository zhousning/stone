class CreateWorkerCerts < ActiveRecord::Migration
  def change
    create_table :worker_certs do |t|
    
      t.string :reg_no,  null: false, default: Setting.systems.default_str
    
      t.string :cert_no,  null: false, default: Setting.systems.default_str
    
      t.datetime :start
    
      t.datetime :end
    
      t.string :dept,  null: false, default: Setting.systems.default_str
    
      t.string :level,  null: false, default: Setting.systems.default_str
    

    
      t.string :cert_front,  null: false, default: Setting.systems.default_str
    
      t.string :cert_back,  null: false, default: Setting.systems.default_str
    
      t.string :start_front,  null: false, default: Setting.systems.default_str
    
      t.string :start_back,  null: false, default: Setting.systems.default_str
    
      t.string :safe_front,  null: false, default: Setting.systems.default_str
    
      t.string :safe_back,  null: false, default: Setting.systems.default_str
    
      t.string :status,  null: false, default: Setting.systems.opening

      t.string :idnumber,  null: false, default: Setting.systems.default_str
    

    
      t.references :labour_worker
    

      t.timestamps null: false
    end
  end
end
