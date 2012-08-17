class Organization < ActiveRecord::Base
  attr_accessible :community_id, :email, :image, :name, :password

  has_secure_password
  validates_uniqueness_of :email



end
