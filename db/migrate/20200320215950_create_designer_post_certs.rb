class CreateDesignerPostCerts < ActiveRecord::Migration
  def change
    create_table :designer_post_certs do |t|
    
      t.string :reg_no,  null: false, default: Setting.systems.default_str
    
      t.datetime :start
    
      t.string :cert_no,  null: false, default: Setting.systems.default_str
    
      t.datetime :end
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.string :status,  null: false, default: Setting.systems.default_str
    
      t.string :idnumber,  null: false, default: Setting.systems.default_str
    

    
      t.string :cert_front,  null: false, default: Setting.systems.default_str
    
      t.string :cert_back,  null: false, default: Setting.systems.default_str
    
      t.string :start_front,  null: false, default: Setting.systems.default_str
    
      t.string :start_back,  null: false, default: Setting.systems.default_str
    

    

    
      t.references :designer_post
    

      t.timestamps null: false
    end
  end
end
