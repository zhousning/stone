class ProspectorDomain < ActiveRecord::Base





  belongs_to :prospector


  belongs_to :domain


end


# == Schema Information
#
# Table name: prospector_domains
#
#  id            :integer         not null, primary key
#  level         :string          default(""), not null
#  prospector_id :integer
#  domain_id     :integer
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#

