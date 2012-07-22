class LiveboardController < ApplicationController
  def index
    @community_id = current_user.community_id
    @community = Community.find_by_id(@community_id).name

    @fliers = Flier.find_all_by_community_id(@community_id)
  end
end
