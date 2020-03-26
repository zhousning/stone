require 'yaml'
require 'logger'
require 'json'
require 'nokogiri'



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
          doc = Nokogiri::HTML(open(html)) 
          style = doc.css("style").to_s
          body = doc.css("body").to_s
          html = body.gsub(/<a[^>]+\/>|<body[^>]+>|<\/body>|body{[^}]+}/, '')
          TablePage.create(:style => style, :html => html, :table_template => @table)
        rescue Exception => e
          break
        end
      end
    end
    
  end
end
