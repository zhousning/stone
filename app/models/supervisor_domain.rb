class SupervisorDomain < ActiveRecord::Base





  belongs_to :supervisor


  belongs_to :domain


end


# == Schema Information
#
# Table name: supervisor_domains
#
#  id            :integer         not null, primary key
#  level         :string          default(""), not null
#  supervisor_id :integer
#  domain_id     :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

