class ConstructProfile < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader
  mount_uploader :cert_back, EnclosureUploader
  mount_uploader :quality_front, EnclosureUploader
  mount_uploader :quality_back, EnclosureUploader

  belongs_to :user


end

