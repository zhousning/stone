class Major < ActiveRecord::Base


  has_many :labour_majors, :dependent => :destroy
  has_many :labours, :through => :labour_majors

  has_many :supervisor_majors, :dependent => :destroy
  has_many :supervisors, :through => :labour_majors

  has_many :prospector_majors, :dependent => :destroy
  has_many :prospectors, :through => :labour_majors

  has_many :designer_majors, :dependent => :destroy
  has_many :designers, :through => :labour_majors

  has_many :monitor_majors, :dependent => :destroy
  has_many :monitors, :through => :labour_majors

  has_many :agentor_majors, :dependent => :destroy
  has_many :agentors, :through => :labour_majors

end

# == Schema Information
#
# Table name: majors
#
#  id         :integer         not null, primary key
#  name       :string          default(""), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

