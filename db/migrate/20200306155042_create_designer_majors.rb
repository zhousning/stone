class CreateDesignerMajors < ActiveRecord::Migration
  def change
    create_table :designer_majors do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :designer_id
    
      t.integer :major_id
    

      t.timestamps null: false
    end
  end
end
