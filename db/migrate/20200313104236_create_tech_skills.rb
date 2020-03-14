class CreateTechSkills < ActiveRecord::Migration
  def change
    create_table :tech_skills do |t|
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :tech_cert_id
    
      t.integer :skill_ctg_id
    

      t.timestamps null: false
    end
  end
end
