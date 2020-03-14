class CreatePrfCtgs < ActiveRecord::Migration
  def change
    create_table :prf_ctgs do |t|
    
      t.string :name,  null: false, default: Setting.systems.default_str
    
      t.timestamps null: false
    end
  end
end
