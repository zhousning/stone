class CreateProjectPages < ActiveRecord::Migration
  def change
    create_table :project_pages do |t|
    
      t.text :content,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :project_table
    

      t.timestamps null: false
    end
  end
end
