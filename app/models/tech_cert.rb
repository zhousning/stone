class TechCert < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader

  mount_uploader :cert_back, EnclosureUploader



  belongs_to :labour_tech


  has_many :tech_skills, :dependent => :destroy
  has_many :skill_ctgs, :through => :tech_skills


end
