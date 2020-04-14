class CreateProjectTables < ActiveRecord::Migration
  def change
    create_table :project_tables do |t|
    
      t.string :category,  null: false, default: Setting.systems.default_str
    
      t.string :number,  null: false, default: Setting.systems.default_str
    
      t.string :name,  null: false, default: Setting.systems.default_str

      t.string :status,  null: false, default: Setting.systems.default_str
    
      t.text :info

      t.text :content

      t.integer :creator

    
      t.string :attachment,  null: false, default: Setting.systems.default_str
    

    
      t.references :project
    

      t.timestamps null: false
    end
  end
end
