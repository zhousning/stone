class DesignerWater < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :stamp_front, EnclosureUploader

  mount_uploader :stamp_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader






  has_many :designer_water_certs, :dependent => :destroy
  accepts_nested_attributes_for :designer_water_certs, reject_if: :all_blank, allow_destroy: true


  belongs_to :user


  belongs_to :designer


end
