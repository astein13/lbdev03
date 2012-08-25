class MyboardController < ApplicationController
  def index
    @channels = Channel.all
    if session[:user_id]
      @invitations = current_user.invitations
      @created_fliers = current_user.created_fliers
      @added_fliers = current_user.added_fliers
      @flier_channels = []
      
      
    

    if session[:organization_id]
      @added_fliers = OrganizationFlier.find_all_by_organization_id_and_attending_status(current_user.id, '1')
      @created_fliers = OrganizationFlier.find_all_by_organization_id_and_attending_status(current_user.id, '9')
    end
  end
  end
end





