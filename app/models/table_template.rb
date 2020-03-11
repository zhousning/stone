class TableTemplate < ActiveRecord::Base



  mount_uploader :attachment, AttachmentUploader




  has_many :table_pages, :dependent => :destroy
  accepts_nested_attributes_for :table_pages, reject_if: :all_blank, allow_destroy: true


end
