class HdctCtg < ActiveRecord::Base






  has_many :worker_hdcts, :dependent => :destroy
  has_many :worker_certs, :through => :worker_hdcts


end
