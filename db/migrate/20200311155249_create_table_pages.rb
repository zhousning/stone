class CreateTablePages < ActiveRecord::Migration
  def change
    create_table :table_pages do |t|
    
      t.text :style,  null: false, default: Setting.systems.default_str
      t.text :html,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :table_template
    

      t.timestamps null: false
    end
  end
end
