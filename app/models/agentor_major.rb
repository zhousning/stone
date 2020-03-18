class AgentorMajor < ActiveRecord::Base





  belongs_to :agentor_co


  belongs_to :major


end


# == Schema Information
#
# Table name: agentor_majors
#
#  id            :integer         not null, primary key
#  level         :string          default(""), not null
#  agentor_co_id :integer
#  major_id      :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

