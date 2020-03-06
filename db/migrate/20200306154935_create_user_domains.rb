class CreateUserDomains < ActiveRecord::Migration
  def change
    create_table :user_domains do |t|
    
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :user_id
    
      t.integer :domain_id
    

      t.timestamps null: false
    end
  end
end
