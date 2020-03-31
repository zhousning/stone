class CreateProjectPages < ActiveRecord::Migration
  def change
    create_table :project_pages do |t|
    
      t.text :style
      t.text :html
    

    

    

    
      t.references :project_table
    

      t.timestamps null: false
    end
  end
end
