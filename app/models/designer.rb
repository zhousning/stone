class Designer < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number

  has_many :designer_domains, :dependent => :destroy
  has_many :domains, :through => :designer_domains
  
  has_many :designer_majors, :dependent => :destroy
  has_many :majors, :through => :designer_majors

  has_many :designer_constructors
  has_many :designer_structures
  has_many :designer_posts
  has_many :designer_waters
  has_many :designer_electrics
  has_many :designer_warms

  belongs_to :user

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

  #validates  :company, :presence => true   
  #validates  :cert, :presence => true
  #validates  :corp, :presence => true
  #validates  :address, :presence => true
  #validates  :idcard, :presence => true
  #validates  :province, :presence => true
  #validates  :city, :presence => true
  #validates  :county, :presence => true
  #validates  :habitation, :presence => true
  #validates  :cert_front, :presence => true
  #validates  :cert_back, :presence => true
  #validates  :quality_front, :presence => true
  #validates  :quality_back, :presence => true
  #validates  :quality_one_front, :presence => true
  #validates  :quality_one_back, :presence => true
  #validates  :quality_two_front, :presence => true
  #validates  :quality_two_back, :presence => true
  #validates  :quality_three_front, :presence => true
  #validates  :quality_three_back, :presence => true
  #validates  :safe_front, :presence => true
  #validates  :safe_back, :presence => true

end




# == Schema Information
#
# Table name: designers
#
#  id                  :integer         not null, primary key
#  company             :string          default(""), not null
#  cert                :string          default(""), not null
#  corp                :string          default(""), not null
#  address             :string          default(""), not null
#  idcard              :string          default(""), not null
#  province            :string          default(""), not null
#  city                :string          default(""), not null
#  county              :string          default(""), not null
#  habitation          :string          default(""), not null
#  cert_front          :string          default(""), not null
#  cert_back           :string          default(""), not null
#  quality_front       :string          default(""), not null
#  quality_back        :string          default(""), not null
#  quality_one_front   :string          default(""), not null
#  quality_one_back    :string          default(""), not null
#  quality_two_front   :string          default(""), not null
#  quality_two_back    :string          default(""), not null
#  quality_three_front :string          default(""), not null
#  quality_three_back  :string          default(""), not null
#  safe_front          :string          default(""), not null
#  safe_back           :string          default(""), not null
#  status              :string          default("新用户"), not null
#  idnumber            :string          default(""), not null
#  user_id             :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

