class Project < ActiveRecord::Base






  belongs_to :labour


  has_many :project_tables, :dependent => :destroy
  accepts_nested_attributes_for :project_tables, reject_if: :all_blank, allow_destroy: true


end
