class LabourWorker < ActiveRecord::Base

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader

  mount_uploader :stamp_front, EnclosureUploader

  mount_uploader :stamp_back, EnclosureUploader



  before_save :store_unique_number
  def store_unique_number
    if self.idnumber == ""
      self.idnumber = "labour_worker+" + Time.now.to_i.to_s + "%04d" % [rand(10000)]
    end
  end



  belongs_to :labour

  belongs_to :user

  has_many :worker_certs, :dependent => :destroy
  accepts_nested_attributes_for :worker_certs, reject_if: :all_blank, allow_destroy: true


end
