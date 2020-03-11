class ProjectTable < ActiveRecord::Base



  mount_uploader :attachment, AttachmentUploader




  has_many :project_pages, :dependent => :destroy
  accepts_nested_attributes_for :project_pages, reject_if: :all_blank, allow_destroy: true


  belongs_to :project


end
