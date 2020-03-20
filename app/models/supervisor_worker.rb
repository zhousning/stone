class SupervisorWorker < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :stamp_front, EnclosureUploader

  mount_uploader :stamp_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader






  belongs_to :user


  belongs_to :supervisor


  #has_many :supervisor_worker_certs, :dependent => :destroy
  #accepts_nested_attributes_for :supervisor_worker_certs, reject_if: :all_blank, allow_destroy: true


end
