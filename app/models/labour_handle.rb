class LabourHandle < ActiveRecord::Base

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader

  mount_uploader :stamp_front, EnclosureUploader

  mount_uploader :stamp_back, EnclosureUploader






  belongs_to :labour


  has_many :handle_certs, :dependent => :destroy
  accepts_nested_attributes_for :handle_certs, reject_if: :all_blank, allow_destroy: true


end
