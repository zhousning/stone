class CreateProspectorMajors < ActiveRecord::Migration
  def change
    create_table :prospector_majors do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :prospector_id
    
      t.integer :major_id
    

      t.timestamps null: false
    end
  end
end
