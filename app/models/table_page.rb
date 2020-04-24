class TablePage < ActiveRecord::Base






  belongs_to :table_template


end



# == Schema Information
#
# Table name: table_pages
#
#  id                :integer         not null, primary key
#  style             :text
#  html              :text
#  table_template_id :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

