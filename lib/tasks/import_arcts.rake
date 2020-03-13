require 'yaml'
require 'logger'

namespace 'db' do
  desc "import arct"
  task(:import_arcts => :environment) do
    import_arcts
  end
end

def import_arcts
  arcts = YAML.load_file("lib/tasks/data/arcts.yaml")
  result = []
  arcts.each do |s|
    @arct = ArctCtg.where(:name =>  s)
    if @arct.blank?
      ArctCtg.create(:name =>  s)
    else
      next
    end
  end
end
