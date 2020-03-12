class LabourMajor < ActiveRecord::Base





  belongs_to :labour


  belongs_to :major


end

# == Schema Information
#
# Table name: labour_majors
#
#  id         :integer         not null, primary key
#  level      :string          default(""), not null
#  labour_id  :integer
#  major_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

