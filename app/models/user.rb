class User < ActiveRecord::Base
  attr_accessible :community_id, :fbid, :fname, :image_url, :lname, :oauth_exp, :oauth_token, :provider
 
  has_many :fliers, :foreign_key => :creator_id
  #has_many :myfliers
  #belongs_to :community, :foreign_key => "community_id"

  def self.from_omniauth(auth)

  where(auth.slice(:provider, :fbid)).first_or_initialize.tap do |user|
    user.provider = auth.provider
    user.fbid = auth.uid
    user.fname = auth.info.first_name
    user.lname = auth.info.last_name
    user.image_url = auth.info.image
    user.oauth_token = auth.credentials.token
    user.oauth_exp = Time.at(auth.credentials.expires_at)
    user.save!
  end
  end



end