class LabourTech < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader

  mount_uploader :stamp_front, EnclosureUploader

  mount_uploader :stamp_back, EnclosureUploader

  mount_uploader :task_front,  EnclosureUploader
    
  mount_uploader :task_back,  EnclosureUploader

  belongs_to :labour

  belongs_to :user

  has_many :tech_certs, :dependent => :destroy
  accepts_nested_attributes_for :tech_certs, reject_if: :all_blank, allow_destroy: true


end


# == Schema Information
#
# Table name: labour_teches
#
#  id           :integer         not null, primary key
#  name         :string          default(""), not null
#  phone        :string          default(""), not null
#  idno         :string          default(""), not null
#  idcard_front :string          default(""), not null
#  idcard_back  :string          default(""), not null
#  hr_front     :string          default(""), not null
#  hr_back      :string          default(""), not null
#  task_front   :string          default(""), not null
#  task_back    :string          default(""), not null
#  stamp_front  :string          default(""), not null
#  stamp_back   :string          default(""), not null
#  status       :string          default("新用户"), not null
#  idnumber     :string          default(""), not null
#  labour_id    :integer
#  user_id      :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

