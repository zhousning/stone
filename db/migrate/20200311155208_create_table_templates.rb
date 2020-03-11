class CreateTableTemplates < ActiveRecord::Migration
  def change
    create_table :table_templates do |t|
    
      t.string :category,  null: false, default: Setting.systems.default_str
    
      t.string :number,  null: false, default: Setting.systems.default_str
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.text :info,  null: false, default: Setting.systems.default_str
    

    

    
      t.string :attachment,  null: false, default: Setting.systems.default_str
    

    

      t.timestamps null: false
    end
  end
end
