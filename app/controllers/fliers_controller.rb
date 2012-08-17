class FliersController < ApplicationController
  before_filter :can_view_flier?, :only => "show"


  def show
    @flier = Flier.find_by_id(params[:id])
    @channels = Channel.all
  end

  def new
    @flier = Flier.new
    @channels = Channel.all
  end
  
  def create
    @channels = Channel.all
     @flier = Flier.create!(params[:flier])
     @users = User.find_all_by_community_id(current_user.community_id)
     @users.each do |user|
      @myflier = Myflier.create!(:user_id => user.id, :flier_id => @flier.id, :attending_status => nil, :myscore => 100)
     end
     @creator_myflier = Myflier.find_by_user_id_and_flier_id(current_user.id, @flier.id)
     @creator_myflier.update_attribute(:attending_status, '9')
     redirect_to :controller => :myfliers, :action => :invite, :flier_id => @flier.id
    

  end
  
  def edit
    @flier = Flier.find_by_id(params[:flier_id])
    @creator_id = @flier.creator_id.to_i
    @channels = Channel.all
   
    unless @creator_id==current_user.id
      redirect_to :controller => "error_pages", :action => "not_your_flier"
    else
     
    end
  end
  def update
    @channels = Channel.all
    @flier = Flier.find_by_id(params[:flier_id])
      if @flier.update_attributes(params[:flier])
      redirect_to(liveboard_path)
      end
  end

  def destroy
    @channels = Channel.all
    @flier = Flier.find_by_id(params[:flier_id])
    @creator_id = @flier.creator_id.to_i
    unless @creator_id==current_user.id
      redirect_to :controller => "error_pages", :action => "not_your_flier"
    else
    
    @flier.destroy
      redirect_to(myboard_path)
    end
  end
end
