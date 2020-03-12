class CreateAgentorMajors < ActiveRecord::Migration
  def change
    create_table :agentor_majors do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :agentor_co_id
    
      t.integer :major_id
    

      t.timestamps null: false
    end
  end
end
