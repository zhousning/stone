class CreateTablePages < ActiveRecord::Migration
  def change
    create_table :table_pages do |t|
    
      t.text :style
      t.text :html
    

    

    

    
      t.references :table_template
    

      t.timestamps null: false
    end
  end
end
