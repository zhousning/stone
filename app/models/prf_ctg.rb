class PrfCtg < ActiveRecord::Base






  has_many :live_prfs, :dependent => :destroy
  has_many :live_certs, :through => :live_prfs


end
