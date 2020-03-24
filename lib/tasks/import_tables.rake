require 'yaml'
require 'logger'
require 'json'



namespace 'db' do
  desc "import html_table"
  task(:import_html_tables => :environment) do
    import_html_tables
  end
end

def import_html_tables
  html_tables = "lib/tasks/data/tablehtml/"
  json_tables = File.read("lib/tasks/data/tableJson.json")

  objs = JSON.parse(json_tables)

  objs.each do |s, k|
    category = s
    k.each do |title|
      item = title.split('+')
      @table = TableTemplate.create(:category => category, :number => item[0], :name => item[1])

      20.times.each do |no|
        page_no = no + 1
        html = html_tables + category + "/" + title + "_" + page_no.to_s + ".html" 
        begin
          page = File.read(html)
          TablePage.create(:content => page.to_s, :table_template => @table)
        rescue
          break
        end
      end
    end
    
  end
end
