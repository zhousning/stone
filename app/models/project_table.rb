class ProjectTable < ActiveRecord::Base



  mount_uploader :attachment, AttachmentUploader




  has_many :project_pages, :dependent => :destroy
  accepts_nested_attributes_for :project_pages, reject_if: :all_blank, allow_destroy: true


  belongs_to :project


end

# == Schema Information
#
# Table name: project_tables
#
#  id         :integer         not null, primary key
#  category   :string          default(""), not null
#  number     :string          default(""), not null
#  name       :string          default(""), not null
#  info       :string          default(""), not null
#  attachment :string          default(""), not null
#  project_id :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

