class CreateCptDepUsers < ActiveRecord::Migration
  def change
    create_table :cpt_dep_users do |t|
      t.string :cpt_id
      t.string :dep_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
