class GroupProspector < ActiveRecord::Base






  belongs_to :project_group


  belongs_to :prospector


end

# == Schema Information
#
# Table name: group_prospectors
#
#  id               :integer         not null, primary key
#  status           :string          default(""), not null
#  idnumber         :string          default(""), not null
#  project_group_id :integer
#  prospector_id    :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

