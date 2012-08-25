class User < ActiveRecord::Base
  attr_accessible :community_id, :fbid, :fname, :image_url, :lname,
                  :oauth_exp, :oauth_token, :provider, :channel_id

  has_many :myfliers,
           :order => :myscore


  has_many :fliers_for_liveboard, :through => :myfliers

           

  has_many :fliers, :through => :myfliers
  
  has_many :added_fliers, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '1']

  has_many :created_fliers, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '9']

  has_many :invitations, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '0']

  has_many :public_added_fliers, :through => :myfliers,
           :class_name =>"Flier",
           :source =>:flier,
           :conditions => ['attending_status=?', '1']

  has_many :added_academic_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => "channel_id = 1" and "attending_status=1"

  has_many :added_arts_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => 'channel_id = 2' and 'attending_status = 1'

  has_many :added_nightlife_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => 'channel_id = 3' and 'attending_status= 1'
         
  has_many :added_sports_fliers, :through => :myfliers,
           :class_name => "Flier",
           :source => :flier,
           :conditions => 'channel_id= 4' and 'attending_status= 1'



  has_many :friendships
  
  has_many :friends, :through => :friendships,
           :class_name => "User",
           :source => :users


  belongs_to :community, :foreign_key => "community_id"



  
  def self.from_omniauth(auth)

  where(auth.slice(:provider, :fbid)).find_or_initialize_by_fbid(auth.uid).tap do |user|
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

  def friends
    @friends_user_ids = Friendship.find_all_by_user_id(self.id)
    @friends = @friends_user_ids.map{|friend| User.find_by_id(friend.friend_id)}
    
  end
  


end