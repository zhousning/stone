class TablePage < ActiveRecord::Base






  belongs_to :table_template


end

# == Schema Information
#
# Table name: table_pages
#
#  id                :integer         not null, primary key
#  content           :text            default(""), not null
#  table_template_id :integer
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#

