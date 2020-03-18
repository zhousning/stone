class CreateCertCtgs < ActiveRecord::Migration
  def change
    create_table :cert_ctgs do |t|
    
      t.string :category,  null: false, default: Setting.systems.default_str
    
      t.string :name,  null: false, default: Setting.systems.default_str
    

    

    

    

      t.timestamps null: false
    end
  end
end
