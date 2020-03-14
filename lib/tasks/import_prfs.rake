require 'yaml'
require 'logger'

namespace 'db' do
  desc "import prf"
  task(:import_prfs => :environment) do
    import_prfs
  end
end

def import_prfs
  prfs = YAML.load_file("lib/tasks/data/prfs.yaml")
  result = []
  prfs.each do |s|
    @prf = PrfCtg.where(:name =>  s)
    if @prf.blank?
      PrfCtg.create(:name =>  s)
    else
      next
    end
  end
end
