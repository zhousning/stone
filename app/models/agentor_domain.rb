class AgentorDomain < ActiveRecord::Base





  belongs_to :agentor_co


  belongs_to :domain


end


# == Schema Information
#
# Table name: agentor_domains
#
#  id            :integer         not null, primary key
#  level         :string          default(""), not null
#  agentor_co_id :integer
#  domain_id     :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

