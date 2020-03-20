class CreateDesignerWarms < ActiveRecord::Migration
  def change
    create_table :designer_warms do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.string :phone,  null: false, default: Setting.systems.default_str
    
      t.string :idno,  null: false, default: Setting.systems.default_str
    
      t.string :status,  null: false, default: Setting.systems.default_str
    
      t.string :idnumber,  null: false, default: Setting.systems.default_str
    

    
      t.string :idcard_front,  null: false, default: Setting.systems.default_str
    
      t.string :idcard_back,  null: false, default: Setting.systems.default_str
    
      t.string :stamp_front,  null: false, default: Setting.systems.default_str
    
      t.string :stamp_back,  null: false, default: Setting.systems.default_str
    
      t.string :hr_front,  null: false, default: Setting.systems.default_str
    
      t.string :hr_back,  null: false, default: Setting.systems.default_str
    

    

    
      t.references :designer
    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
