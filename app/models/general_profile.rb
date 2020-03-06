class GeneralProfile < ActiveRecord::Base

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


  belongs_to :user


end

