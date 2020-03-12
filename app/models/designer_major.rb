class DesignerMajor < ActiveRecord::Base





  belongs_to :designer


  belongs_to :major


end

# == Schema Information
#
# Table name: designer_majors
#
#  id         :integer         not null, primary key
#  level      :string          default(""), not null
#  designer_id  :integer
#  major_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

