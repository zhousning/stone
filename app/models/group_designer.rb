class GroupDesigner < ActiveRecord::Base






  belongs_to :project_group


  belongs_to :designer


end

# == Schema Information
#
# Table name: group_designers
#
#  id               :integer         not null, primary key
#  status           :string          default(""), not null
#  idnumber         :string          default(""), not null
#  project_group_id :integer
#  designer_id      :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

