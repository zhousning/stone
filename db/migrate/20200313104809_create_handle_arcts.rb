class CreateHandleArcts < ActiveRecord::Migration
  def change
    create_table :handle_arcts do |t|
      t.string :level,  null: false, default: Setting.systems.default_str
    
      t.integer :handle_cert_id
    
      t.integer :arct_ctg_id
    

      t.timestamps null: false
    end
  end
end
