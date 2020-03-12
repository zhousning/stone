class MonitorMajor < ActiveRecord::Base





  belongs_to :monitor_co


  belongs_to :major


end

# == Schema Information
#
# Table name: monitor_majors
#
#  id         :integer         not null, primary key
#  level      :string          default(""), not null
#  monitor_id  :integer
#  major_id   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

