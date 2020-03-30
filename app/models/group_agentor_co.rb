class GroupAgentorCo < ActiveRecord::Base






  belongs_to :project_group


  belongs_to :agentor_co


end

# == Schema Information
#
# Table name: group_agentors
#
#  id               :integer         not null, primary key
#  status           :string          default(""), not null
#  idnumber         :string          default(""), not null
#  project_group_id :integer
#  agentor_co_id    :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

