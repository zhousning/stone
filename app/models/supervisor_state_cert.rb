class SupervisorStateCert < ActiveRecord::Base
  include ModelBase
  before_save :store_unique_number


  mount_uploader :cert_front, EnclosureUploader

  mount_uploader :cert_back, EnclosureUploader

  mount_uploader :start_front, EnclosureUploader

  mount_uploader :start_back, EnclosureUploader


  has_many :cert_ships, :dependent => :destroy, primary_key: "idnumber", foreign_key: "foreign_idnumber"
  has_many :cert_ctgs, :through => :cert_ships




  belongs_to :supervisor_state


end

# == Schema Information
#
# Table name: supervisor_state_certs
#
#  id                  :integer         not null, primary key
#  reg_no              :string          default(""), not null
#  start               :datetime
#  cert_no             :string          default(""), not null
#  end                 :datetime
#  level               :string          default(""), not null
#  status              :string          default(""), not null
#  idnumber            :string          default(""), not null
#  cert_front          :string          default(""), not null
#  cert_back           :string          default(""), not null
#  start_front         :string          default(""), not null
#  start_back          :string          default(""), not null
#  supervisor_state_id :integer
#  created_at          :datetime        not null
#  updated_at          :datetime        not null
#

