class MyfliersController < ApplicationController
  def add
    @flier = Flier.find_by_id(params[:flier_id]).addone
    @myflier = Myflier.find_by_user_id_and_flier_id(current_user.id, params[:flier_id])
    @myflier.update_attribute(:attending_status, '1')
    
    
    redirect_to myboard_path

  end

  def delete
    @flier = Flier.find_by_id(params[:flier_id]).minusone
    @myflier = Myflier.find(:first, :conditions => ["flier_id = ? and user_id = ?", params[:flier_id], current_user.id])
    @myflier.update_attribute(:attending_status, nil)
    redirect_to myboard_path

  end

  def invite
    @channels = Channel.all
    @flier = params[:flier_id]
    @friends = current_user.friends
  end

  def send_invite
    
    @invitees = User.find_all_by_id(params["invitee_ids"])
    @invitees.each do |invitee|
       @invitation = Myflier.find_by_user_id_and_flier_id(invitee.id, params[:flier_id])
        @invitation.update_attribute(:attending_status => 0, :inviter_id => current_user.id )

      end
      redirect_to myboard_path

    

  end
end
