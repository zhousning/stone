class Labour < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader
  mount_uploader :cert_back, EnclosureUploader
  mount_uploader :quality_front, EnclosureUploader
  mount_uploader :quality_back, EnclosureUploader
  mount_uploader :quality_one_front, EnclosureUploader
  mount_uploader :quality_one_back, EnclosureUploader
  mount_uploader :quality_two_front, EnclosureUploader
  mount_uploader :quality_two_back, EnclosureUploader
  mount_uploader :quality_three_front, EnclosureUploader
  mount_uploader :quality_three_back, EnclosureUploader
  mount_uploader :safe_front, EnclosureUploader
  mount_uploader :safe_back, EnclosureUploader

  has_many :projects

  has_many :labour_domains, :dependent => :destroy
  has_many :domains, :through => :labour_domains
  
  has_many :labour_majors, :dependent => :destroy
  has_many :majors, :through => :labour_majors

  belongs_to :labour


  def pend
    update_attribute :status, Setting.systems.pending
  end

  def pass
    update_attribute :status, Setting.systems.passed
  end

  def reject
    update_attribute :status, Setting.systems.rejected
  end

end

