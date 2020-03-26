class CreateProjectPages < ActiveRecord::Migration
  def change
    create_table :project_pages do |t|
    
      t.text :style,  null: false, default: Setting.systems.default_str
      t.text :html,  null: false, default: Setting.systems.default_str
    

    

    

    
      t.references :project_table
    

      t.timestamps null: false
    end
  end
end
