class CreateDomains < ActiveRecord::Migration
  def change
    create_table :domains do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    

    

    

    

      t.timestamps null: false
    end
  end
end
