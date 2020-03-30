class ProjectGroupUser < ActiveRecord::Base
  belongs_to :project_group
  belongs_to :cpt_dep_user
end

# == Schema Information
#
# Table name: project_group_users
#
#  id               :integer         not null, primary key
#  project_group_id :integer
#  cpt_dep_user_id  :integer
#  status           :string
#  idnumber         :string
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

