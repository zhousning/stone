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

  has_many :group_agentors, :dependent => :destroy
  has_many :agentor_cos, :through => :group_agentors

  has_many :group_monitors, :dependent => :destroy
  has_many :monitor_cos, :through => :group_monitors

  has_many :group_prospectors, :dependent => :destroy
  has_many :prospectors, :through => :group_prospectors

end
