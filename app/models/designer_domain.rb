class DesignerDomain < ActiveRecord::Base





  belongs_to :designer


  belongs_to :domain


end

# == Schema Information
#
# Table name: designer_domains
#
#  id         :integer         not null, primary key
#  level      :string          default(""), not null
#  designer_id  :integer
#  domain_id  :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

