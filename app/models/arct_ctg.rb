class ArctCtg < ActiveRecord::Base






  has_many :handle_arcts, :dependent => :destroy
  has_many :handle_certs, :through => :handle_arcts


end
