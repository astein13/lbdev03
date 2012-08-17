class MyboardController < ApplicationController
  def index
    
    @added_fliers = current_user.added_fliers
    @invitations = current_user.invitations
    @created_fliers = current_user.created_fliers
    @friends = current_user.friends

    @channels = Channel.all
    

  end


end


