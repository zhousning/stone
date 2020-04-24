class TableTemplate < ActiveRecord::Base



  mount_uploader :attachment, AttachmentUploader


  belongs_to :user


  has_many :table_pages, :dependent => :destroy
  accepts_nested_attributes_for :table_pages, reject_if: :all_blank, allow_destroy: true

  def state_public
    update_attribute :status, Setting.systems.status_public
  end

  def state_private
    update_attribute :status, Setting.systems.status_private
  end

end


# == Schema Information
#
# Table name: table_templates
#
#  id         :integer         not null, primary key
#  category   :string          default(""), not null
#  number     :string          default(""), not null
#  name       :string          default(""), not null
#  status     :string          default("1"), not null
#  info       :text
#  content    :text
#  user_id    :integer
#  attachment :string          default(""), not null
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

