require 'yaml'
require 'logger'

namespace 'db' do
  desc "import major"
  task(:import_majors => :environment) do
    import_majors
  end
end

def import_majors
  majors = YAML.load_file("lib/tasks/data/majors.yaml")
  result = []
  majors.each do |s|
    @major = Major.where(:name =>  s)
    if @major.blank?
      Major.create(:name =>  s)
    else
      next
    end
  end
end
