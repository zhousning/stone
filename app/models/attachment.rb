class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader

  belongs_to :monitor_handle
  belongs_to :monitor_handle
  belongs_to :agentor_handle
end


# == Schema Information
#
# Table name: attachments
#
#  id                :integer         not null, primary key
#  created_at        :datetime        not null
#  updated_at        :datetime        not null
#  file              :string          default(""), not null
#  product_id        :integer
#  monitor_handle_id :integer
#  agentor_handle_id :integer
#

