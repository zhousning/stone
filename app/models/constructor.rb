class Constructor < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number

  mount_uploader :cert_front, EnclosureUploader
  mount_uploader :cert_back, EnclosureUploader
  mount_uploader :quality_front, EnclosureUploader
  mount_uploader :quality_back, EnclosureUploader

  has_many :constructor_handles

  belongs_to :user


end



# == Schema Information
#
# Table name: constructors
#
#  id            :integer         not null, primary key
#  company       :string          default(""), not null
#  cert          :string          default(""), not null
#  corp          :string          default(""), not null
#  address       :string          default(""), not null
#  idcard        :string          default(""), not null
#  province      :string          default(""), not null
#  city          :string          default(""), not null
#  county        :string          default(""), not null
#  habitation    :string          default(""), not null
#  cert_front    :string          default(""), not null
#  cert_back     :string          default(""), not null
#  quality_front :string          default(""), not null
#  quality_back  :string          default(""), not null
#  status        :string          default("新用户"), not null
#  idnumber      :string          default(""), not null
#  user_id       :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

