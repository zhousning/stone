class WorkerCert < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader

  mount_uploader :cert_back, EnclosureUploader

  mount_uploader :start_front, EnclosureUploader

  mount_uploader :start_back, EnclosureUploader

  mount_uploader :safe_front, EnclosureUploader

  mount_uploader :safe_back, EnclosureUploader






  belongs_to :labour_worker


  has_many :worker_hdcts, :dependent => :destroy
  has_many :hdct_ctgs, :through => :worker_hdcts


end
