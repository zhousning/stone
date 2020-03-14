class CreateLivePrfs < ActiveRecord::Migration
  def change
    create_table :live_prfs do |t|
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :live_cert_id
    
      t.integer :prf_ctg_id
    

      t.timestamps null: false
    end
  end
end
