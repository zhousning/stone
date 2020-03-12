class TableTemplate < ActiveRecord::Base



  mount_uploader :attachment, AttachmentUploader




  has_many :table_pages, :dependent => :destroy
  accepts_nested_attributes_for :table_pages, reject_if: :all_blank, allow_destroy: true


end

# == Schema Information
#
# Table name: table_templates
#
#  id         :integer         not null, primary key
#  category   :string          default(""), not null
#  number     :string          default(""), not null
#  name       :string          default(""), not null
#  info       :text            default(""), not null
#  attachment :string          default(""), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

