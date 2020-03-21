class CertCtg < ActiveRecord::Base
  has_many :cert_ships, :dependent => :destroy
  has_many :labour_handles, :through => :cert_ships
  has_many :labour_lines, :through => :cert_ships
  has_many :labour_teches, :through => :cert_ships
  has_many :labour_workers, :through => :cert_ships

  has_many :designer_post_cert,     :through => :cert_ships 
  has_many :supervisor_state_cert,  :through => :cert_ships
  has_many :supervisor_target_cert, :through => :cert_ships
  has_many :supervisor_worker_cert, :through => :cert_ships
end

# == Schema Information
#
# Table name: cert_ctgs
#
#  id         :integer         not null, primary key
#  category   :string          default(""), not null
#  name       :string          default(""), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

