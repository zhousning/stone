class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.timestamps null: false

      t.string :file,  null: false, default: ""

      t.references :product
      t.references :product
      t.references :monitor_handle
      t.references :monitor_handle
      t.references :agentor_handle
    end
  end
end
