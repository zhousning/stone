class CreateLabourMajors < ActiveRecord::Migration
  def change
    create_table :labour_majors do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :labour_id
    
      t.integer :major_id
    

      t.timestamps null: false
    end
  end
end
