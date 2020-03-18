class WorkerCert < ActiveRecord::Base

  mount_uploader :cert_front, EnclosureUploader

  mount_uploader :cert_back, EnclosureUploader

  mount_uploader :start_front, EnclosureUploader

  mount_uploader :start_back, EnclosureUploader

  mount_uploader :safe_front, EnclosureUploader

  mount_uploader :safe_back, EnclosureUploader






  belongs_to :labour_worker


  has_many :cert_ships, :dependent => :destroy, primary_key: "idnumber", foreign_key: "foreign_idnumber"
  has_many :cert_ctgs, :through => :cert_ships


  before_save :store_unique_number
  def store_unique_number
    if self.idnumber == ""
      self.idnumber = Setting.flags.labour_worker + "+" + Time.now.to_i.to_s + "%04d" % [rand(10000)]
    end
  end



end

# == Schema Information
#
# Table name: worker_certs
#
#  id               :integer         not null, primary key
#  reg_no           :string          default(""), not null
#  cert_no          :string          default(""), not null
#  start            :datetime
#  end              :datetime
#  dept             :string          default(""), not null
#  level            :string          default(""), not null
#  cert_front       :string          default(""), not null
#  cert_back        :string          default(""), not null
#  start_front      :string          default(""), not null
#  start_back       :string          default(""), not null
#  safe_front       :string          default(""), not null
#  safe_back        :string          default(""), not null
#  status           :string          default("新用户"), not null
#  labour_worker_id :integer
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

