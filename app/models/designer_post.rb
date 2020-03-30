class DesignerPost < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :task_front, EnclosureUploader

  mount_uploader :task_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader






  has_many :designer_post_certs, :dependent => :destroy
  accepts_nested_attributes_for :designer_post_certs, reject_if: :all_blank, allow_destroy: true


  belongs_to :user


  belongs_to :designer


end


# == Schema Information
#
# Table name: designer_posts
#
#  id           :integer         not null, primary key
#  name         :string          default(""), not null
#  phone        :string          default(""), not null
#  idno         :string          default(""), not null
#  status       :string          default("新用户"), not null
#  idnumber     :string          default(""), not null
#  idcard_front :string          default(""), not null
#  idcard_back  :string          default(""), not null
#  task_front   :string          default(""), not null
#  task_back    :string          default(""), not null
#  hr_front     :string          default(""), not null
#  hr_back      :string          default(""), not null
#  user_id      :integer
#  designer_id  :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

