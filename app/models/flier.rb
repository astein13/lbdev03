class Flier < ActiveRecord::Base
  attr_accessible :category, :community_id, :description, :end_time, :group, :image_url, :start_time, :tag, :title
  belongs_to :users, :foreign_key => :creator_id
end
