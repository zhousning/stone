class LabourLine < ActiveRecord::Base

  mount_uploader :idcard_front, EnclosureUploader

  mount_uploader :idcard_back, EnclosureUploader

  mount_uploader :hr_front, EnclosureUploader

  mount_uploader :hr_back, EnclosureUploader

  mount_uploader :stamp_front, EnclosureUploader

  mount_uploader :stamp_back, EnclosureUploader



  before_save :store_unique_number
  def store_unique_number
    if self.idnumber == ""
      self.idnumber = "labour_line+" + Time.now.to_i.to_s + "%04d" % [rand(10000)]
    end
  end



  belongs_to :labour

  belongs_to :user

  has_many :line_certs, :dependent => :destroy
  accepts_nested_attributes_for :line_certs, reject_if: :all_blank, allow_destroy: true


end

# == Schema Information
#
# Table name: labour_lines
#
#  id           :integer         not null, primary key
#  name         :string          default(""), not null
#  phone        :string          default(""), not null
#  idno         :string          default(""), not null
#  idcard_front :string          default(""), not null
#  idcard_back  :string          default(""), not null
#  hr_front     :string          default(""), not null
#  hr_back      :string          default(""), not null
#  stamp_front  :string          default(""), not null
#  stamp_back   :string          default(""), not null
#  idnumber     :string          default(""), not null
#  labour_id    :integer
#  user_id      :integer
#  created_at   :datetime        not null
#  updated_at   :datetime        not null
#

