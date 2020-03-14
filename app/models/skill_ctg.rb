class SkillCtg < ActiveRecord::Base






  has_many :tech_skills, :dependent => :destroy
  has_many :tech_certs, :through => :tech_skills


end
