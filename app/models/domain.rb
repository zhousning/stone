class Domain < ActiveRecord::Base

  has_many :labour_domains, :dependent => :destroy
  has_many :labours, :through => :labour_domains

  has_many :supervisor_domains, :dependent => :destroy
  has_many :supervisors, :through => :labour_domains

  has_many :prospector_domains, :dependent => :destroy
  has_many :prospectors, :through => :labour_domains

  has_many :designer_domains, :dependent => :destroy
  has_many :designers, :through => :labour_domains

  has_many :monitor_domains, :dependent => :destroy
  has_many :monitors, :through => :labour_domains

  has_many :agentor_domains, :dependent => :destroy
  has_many :agentors, :through => :labour_domains
end

# == Schema Information
#
# Table name: domains
#
#  id         :integer         not null, primary key
#  name       :string          default(""), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

