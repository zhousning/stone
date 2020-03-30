class GroupConstructor < ActiveRecord::Base






  belongs_to :project_group


  belongs_to :constructor


end

# == Schema Information
#
# Table name: group_constructors
#
#  id               :integer         not null, primary key
#  status           :string          default(""), not null
#  idnumber         :string          default(""), not null
#  project_group_id :integer
#  constructor_id   :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

