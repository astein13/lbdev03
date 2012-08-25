class Organization < ActiveRecord::Base
  attr_accessible :name, :community_id, :email, :image, :password, :password_confirmation

  has_secure_password
  validates_uniqueness_of :email
  validates :email, :presence => {:message => 'You must enter an email for your organization.'}
  validates :community_id, :presence => {:message => 'Please select a community for your organizatoin'}
  validates :name, :presence => { :message => 'Your organization needs a name.'}
  validates :image, :presence => { :message => 'Your organization needs an image.'}
  validates :password, :presence => { :message => 'Please enter a password.'}
  validates :password_confirmation, :presence => {:message => 'Please confirm your password.'}

  has_many :OrganizationFliers

  has_many :fliers, :through => :OrganizationFliers,
           :order => :added_count

  has_many :added_fliers, :through => :OrganizationFliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '1']

  has_many :created_fliers, :through => :OrganizationFliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '9']

  has_attached_file :image, :styles => { :thumb => "200 x 200", :large => "400 x 400"},
                             :quality => { :thumb => "-quality 80", :large => '-quality 80'}

end
