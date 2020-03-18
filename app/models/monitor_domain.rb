class MonitorDomain < ActiveRecord::Base





  belongs_to :monitor_co


  belongs_to :domain


end


# == Schema Information
#
# Table name: monitor_domains
#
#  id            :integer         not null, primary key
#  level         :string          default(""), not null
#  monitor_co_id :integer
#  domain_id     :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

