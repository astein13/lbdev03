class Organization < ActiveRecord::Base
  attr_accessible :community_id, :email, :image, :name, :password, :password_confirmation

  has_secure_password
  validates_uniqueness_of :email

  has_many :OrganizationFliers

  has_many :fliers, :through => :OrganizationFliers

  has_many :added_fliers, :through => :OrganizationFliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '1']

  has_many :created_fliers, :through => :OrganizationFliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '9']


end
