class LiveboardController < ApplicationController
  def index
    @community_id = current_user.community_id
    @community_name = Community.find_by_id(@community_id).name
    @community = Community.find_by_id(@community_id)
    @channels = Channel.all

    
    # initiate an array to hold the user's myfliers that will be displayed on liveboard
    @myfliers_for_liveboard = []
    @fliers_for_liveboard = []

    # for each flier set to public in the user's network, find the user's corresponding
    # myflier and add it to the myfliers_for_liveboard array.  Finally, sort this array
    # by its relevance score.
    @community.public_fliers.each do |flier|
       flier.myfliers.each do |myflier|
        if myflier.user_id == current_user.id
       @myfliers_for_liveboard << myflier
       @fliers_for_liveboard << flier
      end
    end
      @myfliers_for_liveboard.sort!{|a,b| b.myscore <=> a.myscore}
    end
  
    #create an array of all fliers that the user has already added
    @current_user_added_fliers = current_user.added_fliers

    #create an array of all fliers that the user created
    @current_user_created_fliers = current_user.created_fliers

    #create an array of fliers that should have an option to add to my board
    @fliers_for_adding = @fliers_for_liveboard - (current_user.added_fliers + current_user.created_fliers)
    @channels = Channel.all

  end
end
