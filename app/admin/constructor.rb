ActiveAdmin.register Constructor  do

  permit_params  :company, :cert, :corp, :address, :idcard, :province, :city, :county, :habitation

  menu label: Setting.constructors.label
  config.per_page = 20
  config.sort_order = "id_asc"

  
  filter :company, :label => Setting.constructors.company
  filter :cert, :label => Setting.constructors.cert
  filter :corp, :label => Setting.constructors.corp
  filter :address, :label => Setting.constructors.address
  filter :idcard, :label => Setting.constructors.idcard
  filter :province, :label => Setting.constructors.province
  filter :city, :label => Setting.constructors.city
  filter :county, :label => Setting.constructors.county
  filter :habitation, :label => Setting.constructors.habitation
  filter :created_at

  index :title=>Setting.constructors.label + "管理" do
    selectable_column
    id_column
    
    column Setting.constructors.company, :company
    column Setting.constructors.cert, :cert
    column Setting.constructors.corp, :corp
    column Setting.constructors.address, :address
    column Setting.constructors.idcard, :idcard
    column Setting.constructors.province, :province
    column Setting.constructors.city, :city
    column Setting.constructors.county, :county
    column Setting.constructors.habitation, :habitation

    column "创建时间", :created_at, :sortable=>:created_at do |f|
      f.created_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    column "更新时间", :updated_at do |f|
      f.updated_at.strftime('%Y-%m-%d %H:%M:%S')
    end
    actions
  end

  form do |f|
    f.inputs "添加" + Setting.constructors.label do
      
      f.input :company, :label => Setting.constructors.company 
      f.input :cert, :label => Setting.constructors.cert 
      f.input :corp, :label => Setting.constructors.corp 
      f.input :address, :label => Setting.constructors.address 
      f.input :idcard, :label => Setting.constructors.idcard 
      f.input :province, :label => Setting.constructors.province 
      f.input :city, :label => Setting.constructors.city 
      f.input :county, :label => Setting.constructors.county 
      f.input :habitation, :label => Setting.constructors.habitation 
    end
    f.actions
  end

  show :title=>Setting.constructors.label + "信息" do
    attributes_table do
      row "ID" do
        constructor.id
      end
      
      row Setting.constructors.company do
        constructor.company
      end
      row Setting.constructors.cert do
        constructor.cert
      end
      row Setting.constructors.corp do
        constructor.corp
      end
      row Setting.constructors.address do
        constructor.address
      end
      row Setting.constructors.idcard do
        constructor.idcard
      end
      row Setting.constructors.province do
        constructor.province
      end
      row Setting.constructors.city do
        constructor.city
      end
      row Setting.constructors.county do
        constructor.county
      end
      row Setting.constructors.habitation do
        constructor.habitation
      end

      row "创建时间" do
        constructor.created_at.strftime('%Y-%m-%d %H:%M:%S')
      end
      row "更新时间" do
        constructor.updated_at.strftime('%Y-%m-%d %H:%M:%S')
      end
    end
  end

end
