ActiveAdmin.register GeneralProfile  do

  permit_params  :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation

  menu label: Setting.general_profiles.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :company, :label => Setting.general_profiles.company
  filter :cert, :label => Setting.general_profiles.cert
  filter :corp, :label => Setting.general_profiles.corp
  filter :address, :label => Setting.general_profiles.address
  filter :idcard, :label => Setting.general_profiles.idcard
  filter :province, :label => Setting.general_profiles.province
  filter :city, :label => Setting.general_profiles.city
  filter :county, :label => Setting.general_profiles.county
  filter :habitation, :label => Setting.general_profiles.habitation
  filter :created_at

  index :title=>Setting.general_profiles.label + "管理" do
    selectable_column
    id_column
    
    column Setting.general_profiles.company, :company
    column Setting.general_profiles.cert, :cert
    column Setting.general_profiles.corp, :corp
    column Setting.general_profiles.address, :address
    column Setting.general_profiles.idcard, :idcard
    column Setting.general_profiles.province, :province
    column Setting.general_profiles.city, :city
    column Setting.general_profiles.county, :county
    column Setting.general_profiles.habitation, :habitation

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.general_profiles.label do
      
      f.input :company, :label => Setting.general_profiles.company 
      f.input :cert, :label => Setting.general_profiles.cert 
      f.input :corp, :label => Setting.general_profiles.corp 
      f.input :address, :label => Setting.general_profiles.address 
      f.input :idcard, :label => Setting.general_profiles.idcard 
      f.input :province, :label => Setting.general_profiles.province 
      f.input :city, :label => Setting.general_profiles.city 
      f.input :county, :label => Setting.general_profiles.county 
      f.input :habitation, :label => Setting.general_profiles.habitation 
    end
    f.actions
  end

  show :title=>Setting.general_profiles.label + "信息" do
    attributes_table do
      row "ID" do
        general_profile.id
      end
      
      row Setting.general_profiles.company do
        general_profile.company
      end
      row Setting.general_profiles.cert do
        general_profile.cert
      end
      row Setting.general_profiles.corp do
        general_profile.corp
      end
      row Setting.general_profiles.address do
        general_profile.address
      end
      row Setting.general_profiles.idcard do
        general_profile.idcard
      end
      row Setting.general_profiles.province do
        general_profile.province
      end
      row Setting.general_profiles.city do
        general_profile.city
      end
      row Setting.general_profiles.county do
        general_profile.county
      end
      row Setting.general_profiles.habitation do
        general_profile.habitation
      end

      row "创建时间" do
        general_profile.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        general_profile.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
