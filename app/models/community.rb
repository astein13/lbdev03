class Community < ActiveRecord::Base
  attr_accessible :name
  has_many :fliers

  has_many :public_fliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['privacy_status=?', '1']

  has_many :private_fliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['privacy_status=?', '0']


  has_many :users
  
end
