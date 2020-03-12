class CreateSupervisorMajors < ActiveRecord::Migration
  def change
    create_table :supervisor_majors do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :supervisor_id
    
      t.integer :major_id
    

      t.timestamps null: false
    end
  end
end
