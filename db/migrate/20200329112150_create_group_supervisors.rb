class CreateGroupSupervisors < ActiveRecord::Migration
  def change
    create_table :group_supervisors do |t|
    
      t.string :status,  null: false, default: Setting.systems.default_str
    
      t.string :idnumber,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :project_group
    
      t.references :supervisor
    

      t.timestamps null: false
    end
  end
end
