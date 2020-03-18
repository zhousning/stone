class CreateCertShips < ActiveRecord::Migration
  def change
    create_table :cert_ships do |t|
      t.integer :cert_ctg_id
      t.string :foreign_idnumber
      t.string :level

      t.timestamps null: false
    end
  end
end
