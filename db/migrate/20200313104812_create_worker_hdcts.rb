class CreateWorkerHdcts < ActiveRecord::Migration
  def change
    create_table :worker_hdcts do |t|
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :worker_cert_id
    
      t.integer :hdct_ctg_id
    

      t.timestamps null: false
    end
  end
end
