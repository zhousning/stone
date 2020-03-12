class CreateProspectorDomains < ActiveRecord::Migration
  def change
    create_table :prospector_domains do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :prospector_id
    
      t.integer :domain_id
    

      t.timestamps null: false
    end
  end
end
