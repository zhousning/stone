class GroupSupervisor < ActiveRecord::Base






  belongs_to :project_group


  belongs_to :supervisor


end

# == Schema Information
#
# Table name: group_supervisors
#
#  id               :integer         not null, primary key
#  status           :string          default(""), not null
#  idnumber         :string          default(""), not null
#  project_group_id :integer
#  supervisor_id    :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

