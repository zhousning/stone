# == Schema Information
#
# Table name: enclosures
#
#  id               :integer          not null, primary key
#  file             :string           default(""), not null
#  notice_id        :integer
#  website_id       :integer
#  page_id          :integer
#  block_content_id :integer
#  format_id        :integer
#  carousel_id      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Attachment < ActiveRecord::Base
  mount_uploader :file, AttachmentUploader

end
