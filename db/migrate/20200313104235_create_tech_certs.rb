class CreateTechCerts < ActiveRecord::Migration
  def change
    create_table :tech_certs do |t|
    
      t.string :cert_no,  null: false, default: Setting.systems.default_str
    
      t.datetime :start
    
      t.string :dept,  null: false, default: Setting.systems.default_str
    
      t.string :level,  null: false, default: Setting.systems.default_str
    

      t.string :cert_front,  null: false, default: Setting.systems.default_str
    
      t.string :cert_back,  null: false, default: Setting.systems.default_str
    
    
      t.string :status,  null: false, default: Setting.systems.opening

    

    
      t.references :labour_tech
    

      t.timestamps null: false
    end
  end
end
