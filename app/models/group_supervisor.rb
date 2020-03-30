class GroupSupervisor < ActiveRecord::Base






  belongs_to :project_group


  belongs_to :supervisor



  def pend
    update_attribute :status, Setting.project_groups.status_pending
  end

  def agree 
    update_attribute :status, Setting.project_groups.status_join
  end

  def reject
    update_attribute :status, Setting.project_groups.status_reject
  end

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

