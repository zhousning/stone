class CreateTableTemplates < ActiveRecord::Migration
  def change
    create_table :table_templates do |t|
    
      t.string :category,  null: false, default: Setting.systems.default_str
    
      t.string :number,  null: false, default: Setting.systems.default_str
    
      t.string :name,  null: false, default: Setting.systems.default_str

      t.string :status,  null: false, default: Setting.systems.status_public
    
      t.text :info

      t.text :content
    

    
      t.references :user

    
      t.string :attachment,  null: false, default: Setting.systems.default_str
    

    

      t.timestamps null: false
    end
  end
end
