class ProjectPage < ActiveRecord::Base






  belongs_to :project_table


end



# == Schema Information
#
# Table name: project_pages
#
#  id               :integer         not null, primary key
#  style            :text
#  html             :text
#  project_table_id :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

