class Domain < ActiveRecord::Base

  has_many :user_domains, :dependent => :destroy
  has_many :users, :through => :user_domains

end
