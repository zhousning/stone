class CreateProjectGroupUsers < ActiveRecord::Migration
  def change
    create_table :project_group_users do |t|
      t.integer :project_group_id
      t.integer :cpt_dep_user_id
      t.string :status
      t.string :idnumber

      t.timestamps null: false
    end
  end
end
