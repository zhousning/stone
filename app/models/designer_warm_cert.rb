class DesignerWarmCert < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader

  mount_uploader :cert_back, EnclosureUploader

  mount_uploader :start_front, EnclosureUploader

  mount_uploader :start_back, EnclosureUploader






  belongs_to :designer_warm


end


# == Schema Information
#
# Table name: designer_warm_certs
#
#  id               :integer         not null, primary key
#  reg_no           :string          default(""), not null
#  start            :datetime
#  cert_no          :string          default(""), not null
#  end              :datetime
#  level            :string          default(""), not null
#  status           :string          default("新用户"), not null
#  idnumber         :string          default(""), not null
#  cert_front       :string          default(""), not null
#  cert_back        :string          default(""), not null
#  start_front      :string          default(""), not null
#  start_back       :string          default(""), not null
#  designer_warm_id :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

