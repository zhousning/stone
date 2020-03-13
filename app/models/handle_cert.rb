class HandleCert < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader

  mount_uploader :cert_back, EnclosureUploader

  mount_uploader :start_front, EnclosureUploader

  mount_uploader :start_back, EnclosureUploader

  mount_uploader :safe_front, EnclosureUploader

  mount_uploader :safe_back, EnclosureUploader






  belongs_to :labour_handle


  has_many :handle_arcts, :dependent => :destroy
  has_many :arct_ctgs, :through => :handle_arcts


end
