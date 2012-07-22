class UsersController < ApplicationController
   skip_before_filter :has_community?
   
  def create
  end

  def update
    @user = current_user
    @user.update_attributes(params[:user])
    redirect_to root_url, :notice => 'User updated.'
  end

  def show
  end

  def destroy
  end

  def community_select
   
    @user = current_user
  
  end



end

