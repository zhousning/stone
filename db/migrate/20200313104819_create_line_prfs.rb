class CreateLinePrfs < ActiveRecord::Migration
  def change
    create_table :line_prves do |t|
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :line_cert_id
    
      t.integer :prf_ctg_id
    

      t.timestamps null: false
    end
  end
end
