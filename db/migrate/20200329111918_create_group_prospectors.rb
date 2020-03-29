class CreateGroupProspectors < ActiveRecord::Migration
  def change
    create_table :group_prospectors do |t|
    
      t.string :status,  null: false, default: Setting.systems.default_str
    
      t.string :idnumber,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :project_group
    
      t.references :prospector
    

      t.timestamps null: false
    end
  end
end
