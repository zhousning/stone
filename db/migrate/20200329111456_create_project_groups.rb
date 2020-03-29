class CreateProjectGroups < ActiveRecord::Migration
  def change
    create_table :project_groups do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.string :status,  null: false, default: Setting.systems.default_str
    
      t.string :idnumber,  null: false, default: Setting.systems.default_str
    

    

    

    

      t.timestamps null: false
    end
  end
end
