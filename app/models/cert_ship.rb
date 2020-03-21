class CertShip < ActiveRecord::Base
  belongs_to :cert_ctg
  belongs_to :handle_cert, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
  belongs_to :line_cert, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
  belongs_to :line_tech, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
  belongs_to :line_worker, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
  belongs_to :designer_post_cert, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
  belongs_to :supervisor_state_cert, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
  belongs_to :supervisor_target_cert, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
  belongs_to :supervisor_worker_cert, :primary_key => "foreign_idnumber", :foreign_key => "idnumber"
end

# == Schema Information
#
# Table name: cert_ships
#
#  id               :integer         not null, primary key
#  cert_ctg_id      :integer
#  foreign_idnumber :string
#  level            :string
#  created_at       :datetime        not null
#  updated_at       :datetime        not null
#

