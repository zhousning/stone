class CptDepUser < ActiveRecord::Base
  has_many :project_group_users, :dependent => :destroy
  has_many :project_groups, :through => :project_group_users
end

# == Schema Information
#
# Table name: cpt_dep_users
#
#  id         :integer         not null, primary key
#  cpt_id     :string
#  dep_id     :string
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

