class LabourDomain < ActiveRecord::Base





  belongs_to :labour


  belongs_to :domain


end

# == Schema Information
#
# Table name: labour_domains
#
#  id         :integer         not null, primary key
#  level      :string          default(""), not null
#  labour_id  :integer
#  domain_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

