require 'yaml'
require 'logger'

namespace 'db' do
  desc "import hdct"
  task(:import_hdcts => :environment) do
    import_hdcts
  end
end

def import_hdcts
  hdcts = YAML.load_file("lib/tasks/data/hdcts.yaml")
  result = []
  hdcts.each do |s|
    @hdct = HdctCtg.where(:name =>  s)
    if @hdct.blank?
      HdctCtg.create(:name =>  s)
    else
      next
    end
  end
end
