require 'yaml'
require 'logger'

namespace 'db' do
  desc "import domain"
  task(:import_domains => :environment) do
    import_domains
  end
end

def import_domains
  domains = YAML.load_file("lib/tasks/data/domains.yaml")
  result = []
  domains.each do |s|
    @domain = Domain.where(:name =>  s)
    if @domain.blank?
      Domain.create(:name =>  s)
    else
      next
    end
  end
end
