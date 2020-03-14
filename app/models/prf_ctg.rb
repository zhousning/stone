class PrfCtg < ActiveRecord::Base






  has_many :line_prfs, :dependent => :destroy
  has_many :line_certs, :through => :line_prfs


end
