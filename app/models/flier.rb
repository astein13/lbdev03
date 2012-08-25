class Flier < ActiveRecord::Base
  attr_accessible :category, :community_id, :description, :image,
    :end_time, :group, :start_time, :tag, :title, :privacy_status, :channel_id, :creator_id, :added_count
    validates :community_id, :presence => true
    validates :description, :presence => { :message => "You need to describe your event"}
    validates :image, :presence => { :message => "You must upload an image for your event." }
    validates :end_time, :presence => true
    validates :start_time, :presence => true
    validates :title, :presence => { :message => "Your event needs a title."}
    validates :privacy_status, :presence => true

  has_many :myfliers, :dependent => :delete_all
  has_many :OrganizationFliers, :dependent => :delete_all
  belongs_to :communities, :foreign_key => "community_id"
  belongs_to :channels, :foreign_key => "channel_id"
  

   has_attached_file :image, :styles => { :thumb => "200 x 200", :large => "400 x 400"},
                             :quality => { :thumb => "-quality 80", :large => '-quality 80'}

  def addone
    self.increment!(:added_count, by = 1)
  end

  def minusone
    self.increment!(:added_count, by = -1)
  end
 

end
