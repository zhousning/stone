require 'yaml'
require 'logger'

namespace 'db' do
  desc "import cert_ctg"
  task(:import_cert_ctgs => :environment) do
    import_cert_ctgs
  end
end

def import_cert_ctgs
  cert_ctgs = YAML.load_file("lib/tasks/data/cert_ctgs.yaml")
  result = []
  cert_ctgs.each do |s|
    category = s["category"]
    s["name"].each do |name|
      @cert_ctg = CertCtg.where(:category => category, :name => name)
      if @cert_ctg.blank?
        CertCtg.create(:category => category, :name => name)
      else
        next
      end
    end

  end
end
