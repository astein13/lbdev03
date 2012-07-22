class FliersController < ApplicationController
  def show
  end

  def new
    @flier = Flier.new
    
  end
  def create
     @flier = current_user.fliers.build(params[:flier])
     @flier.save!
     redirect_to root_url, :notice => 'Your flier has been created.'
  end
  
  def update
  end

  def destroy
  end
end
