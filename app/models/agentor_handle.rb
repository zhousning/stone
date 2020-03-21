class AgentorHandle < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :stamp_front, EnclosureUploader

  mount_uploader :stamp_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader





  has_many :attachments, :dependent => :destroy
  accepts_nested_attributes_for :attachments, reject_if: :all_blank, allow_destroy: true


  belongs_to :user
  belongs_to :agentor_co


end

# == Schema Information
#
# Table name: agentor_handles
#
#  id            :integer         not null, primary key
#  name          :string          default(""), not null
#  phone         :string          default(""), not null
#  idno          :string          default(""), not null
#  cpt_job       :string          default(""), not null
#  prj_job       :string          default(""), not null
#  idcard_front  :string          default(""), not null
#  idcard_back   :string          default(""), not null
#  stamp_front   :string          default(""), not null
#  stamp_back    :string          default(""), not null
#  hr_front      :string          default(""), not null
#  hr_back       :string          default(""), not null
#  status        :string          default("新用户"), not null
#  idnumber      :string          default(""), not null
#  agentor_co_id :integer
#  user_id       :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

