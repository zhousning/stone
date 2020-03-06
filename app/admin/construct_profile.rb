ActiveAdmin.register ConstructProfile  do

  permit_params  :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation

  menu label: Setting.construct_profiles.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :company, :label => Setting.construct_profiles.company
  filter :cert, :label => Setting.construct_profiles.cert
  filter :corp, :label => Setting.construct_profiles.corp
  filter :address, :label => Setting.construct_profiles.address
  filter :idcard, :label => Setting.construct_profiles.idcard
  filter :province, :label => Setting.construct_profiles.province
  filter :city, :label => Setting.construct_profiles.city
  filter :county, :label => Setting.construct_profiles.county
  filter :habitation, :label => Setting.construct_profiles.habitation
  filter :created_at

  index :title=>Setting.construct_profiles.label + "管理" do
    selectable_column
    id_column
    
    column Setting.construct_profiles.company, :company
    column Setting.construct_profiles.cert, :cert
    column Setting.construct_profiles.corp, :corp
    column Setting.construct_profiles.address, :address
    column Setting.construct_profiles.idcard, :idcard
    column Setting.construct_profiles.province, :province
    column Setting.construct_profiles.city, :city
    column Setting.construct_profiles.county, :county
    column Setting.construct_profiles.habitation, :habitation

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.construct_profiles.label do
      
      f.input :company, :label => Setting.construct_profiles.company 
      f.input :cert, :label => Setting.construct_profiles.cert 
      f.input :corp, :label => Setting.construct_profiles.corp 
      f.input :address, :label => Setting.construct_profiles.address 
      f.input :idcard, :label => Setting.construct_profiles.idcard 
      f.input :province, :label => Setting.construct_profiles.province 
      f.input :city, :label => Setting.construct_profiles.city 
      f.input :county, :label => Setting.construct_profiles.county 
      f.input :habitation, :label => Setting.construct_profiles.habitation 
    end
    f.actions
  end

  show :title=>Setting.construct_profiles.label + "信息" do
    attributes_table do
      row "ID" do
        construct_profile.id
      end
      
      row Setting.construct_profiles.company do
        construct_profile.company
      end
      row Setting.construct_profiles.cert do
        construct_profile.cert
      end
      row Setting.construct_profiles.corp do
        construct_profile.corp
      end
      row Setting.construct_profiles.address do
        construct_profile.address
      end
      row Setting.construct_profiles.idcard do
        construct_profile.idcard
      end
      row Setting.construct_profiles.province do
        construct_profile.province
      end
      row Setting.construct_profiles.city do
        construct_profile.city
      end
      row Setting.construct_profiles.county do
        construct_profile.county
      end
      row Setting.construct_profiles.habitation do
        construct_profile.habitation
      end

      row "创建时间" do
        construct_profile.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        construct_profile.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
