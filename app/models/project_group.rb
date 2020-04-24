class ProjectGroup < ActiveRecord::Base
  has_one :project

  has_many :project_group_users, :dependent => :destroy
  has_many :cpt_dep_users, :through => :project_group_users

  has_many :group_labours, :dependent => :destroy
  has_many :labours, :through => :group_labours

  has_many :group_constructors, :dependent => :destroy
  has_many :constructors, :through => :group_constructors

  has_many :group_supervisors, :dependent => :destroy
  has_many :supervisors, :through => :group_supervisors

  has_many :group_designers, :dependent => :destroy
  has_many :designers, :through => :group_designers

  has_many :group_agentor_cos, :dependent => :destroy
  has_many :agentor_cos, :through => :group_agentor_cos

  has_many :group_monitor_cos, :dependent => :destroy
  has_many :monitor_cos, :through => :group_monitor_cos

  has_many :group_prospectors, :dependent => :destroy
  has_many :prospectors, :through => :group_prospectors

end


# == Schema Information
#
# Table name: project_groups
#
#  id         :integer         not null, primary key
#  name       :string          default(""), not null
#  status     :string          default(""), not null
#  idnumber   :string          default(""), not null
#  creator    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

