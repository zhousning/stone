class CreateAgentorDomains < ActiveRecord::Migration
  def change
    create_table :agentor_domains do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :agentor_co_id
    
      t.integer :domain_id
    

      t.timestamps null: false
    end
  end
end
