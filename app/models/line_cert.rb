class LineCert < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader

  mount_uploader :cert_back, EnclosureUploader

  mount_uploader :start_front, EnclosureUploader

  mount_uploader :start_back, EnclosureUploader

  mount_uploader :safe_front, EnclosureUploader

  mount_uploader :safe_back, EnclosureUploader






  belongs_to :labour_line


  has_many :line_prfs, :dependent => :destroy
  has_many :prf_ctgs, :through => :line_prfs


end
