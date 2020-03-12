class ProspectorMajor < ActiveRecord::Base





  belongs_to :prospector


  belongs_to :major


end

# == Schema Information
#
# Table name: prospector_majors
#
#  id         :integer         not null, primary key
#  level      :string          default(""), not null
#  prospector_id  :integer
#  major_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

