class CreateArctCtgs < ActiveRecord::Migration
  def change
    create_table :arct_ctgs do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.string :level,  null: false, default: Setting.systems.default_str
    

    

    

    

      t.timestamps null: false
    end
  end
end
