require 'yaml'
require 'logger'

namespace 'db' do
  desc "import table"
  task(:import_tables => :environment) do
    import_tables
  end
end

def import_tables
  tables = YAML.load_file("lib/tasks/data/tables.yaml")
  result = []
  tables.each do |s|
    category = s["category"]
    s["name"].each do |name|
      @table = CertCtg.where(:category => category, :name => name)
      if @table.blank?
        CertCtg.create(:category => category, :name => name)
      else
        next
      end
    end

  end
end
