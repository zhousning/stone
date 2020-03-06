class Major < ActiveRecord::Base


  has_many :user_majors, :dependent => :destroy
  has_many :users, :through => :user_majors


end
