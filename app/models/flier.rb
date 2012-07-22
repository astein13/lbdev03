class Flier < ActiveRecord::Base
  attr_accessible :category, :community_id, :description, :image,
    :end_time, :group, :start_time, :tag, :title, :privacy_status
  validates :category, :presence => true
  validates :community_id, :presence => true
  validates :description, :presence => true
  validates :image, :presence => true
  validates :end_time, :presence => true
  validates :start_time, :presence => true
  validates :title, :presence => true
  validates :privacy_status, :presence => true
  belongs_to :users, :foreign_key => :creator_id
  image_accessor :image
end
