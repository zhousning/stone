class CreateSupervisorDomains < ActiveRecord::Migration
  def change
    create_table :supervisor_domains do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :supervisor_id
    
      t.integer :domain_id
    

      t.timestamps null: false
    end
  end
end
