ActiveAdmin.register Labour  do

  permit_params  :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation

  menu label: Setting.labours.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :company, :label => Setting.labours.company
  filter :cert, :label => Setting.labours.cert
  filter :corp, :label => Setting.labours.corp
  filter :address, :label => Setting.labours.address
  filter :idcard, :label => Setting.labours.idcard
  filter :province, :label => Setting.labours.province
  filter :city, :label => Setting.labours.city
  filter :county, :label => Setting.labours.county
  filter :habitation, :label => Setting.labours.habitation
  filter :created_at

  index :title=>Setting.labours.label + "管理" do
    selectable_column
    id_column
    
    column Setting.labours.company, :company
    column Setting.labours.cert, :cert
    column Setting.labours.corp, :corp
    column Setting.labours.address, :address
    column Setting.labours.idcard, :idcard
    column Setting.labours.province, :province
    column Setting.labours.city, :city
    column Setting.labours.county, :county
    column Setting.labours.habitation, :habitation

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.labours.label do
      
      f.input :company, :label => Setting.labours.company 
      f.input :cert, :label => Setting.labours.cert 
      f.input :corp, :label => Setting.labours.corp 
      f.input :address, :label => Setting.labours.address 
      f.input :idcard, :label => Setting.labours.idcard 
      f.input :province, :label => Setting.labours.province 
      f.input :city, :label => Setting.labours.city 
      f.input :county, :label => Setting.labours.county 
      f.input :habitation, :label => Setting.labours.habitation 
    end
    f.actions
  end

  show :title=>Setting.labours.label + "信息" do
    attributes_table do
      row "ID" do
        labour.id
      end
      
      row Setting.labours.company do
        labour.company
      end
      row Setting.labours.cert do
        labour.cert
      end
      row Setting.labours.corp do
        labour.corp
      end
      row Setting.labours.address do
        labour.address
      end
      row Setting.labours.idcard do
        labour.idcard
      end
      row Setting.labours.province do
        labour.province
      end
      row Setting.labours.city do
        labour.city
      end
      row Setting.labours.county do
        labour.county
      end
      row Setting.labours.habitation do
        labour.habitation
      end

      row "创建时间" do
        labour.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        labour.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
