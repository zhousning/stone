class SupervisorMajor < ActiveRecord::Base





  belongs_to :supervisor


  belongs_to :major


end


# == Schema Information
#
# Table name: supervisor_majors
#
#  id            :integer         not null, primary key
#  level         :string          default(""), not null
#  supervisor_id :integer
#  major_id      :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

