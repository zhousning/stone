class CreateConstructors < ActiveRecord::Migration
  def change
    create_table :constructors do |t|
    
      t.string :company,  null: false, default: Setting.systems.default_str
    
      t.string :cert,  null: false, default: Setting.systems.default_str
    
      t.string :corp,  null: false, default: Setting.systems.default_str
    
      t.string :address,  null: false, default: Setting.systems.default_str
    
      t.string :idcard,  null: false, default: Setting.systems.default_str
    
      t.string :province,  null: false, default: Setting.systems.default_str
    
      t.string :city,  null: false, default: Setting.systems.default_str
    
      t.string :county,  null: false, default: Setting.systems.default_str
    
      t.string :habitation,  null: false, default: Setting.systems.default_str
    
      t.string :cert_front,  null: false, default: Setting.systems.default_str
      t.string :cert_back,  null: false, default: Setting.systems.default_str
      t.string :quality_front,  null: false, default: Setting.systems.default_str
      t.string :quality_back,  null: false, default: Setting.systems.default_str

    
      t.string :status,  null: false, default: Setting.systems.opening

      t.string :idnumber,  null: false, default: Setting.systems.default_str

    
      t.references :user
    

      t.timestamps null: false
    end
  end
end
