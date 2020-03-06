# == Schema Information
#
# Table name: notices
#
#  id         :integer          not null, primary key
#  title      :string           default(""), not null
#  content    :text             default(""), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Nest < ActiveRecord::Base

  has_many :properties, :dependent => :destroy
  accepts_nested_attributes_for :properties, reject_if: :all_blank, allow_destroy: true

  belongs_to :template

end
