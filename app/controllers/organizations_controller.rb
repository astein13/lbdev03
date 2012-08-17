class OrganizationsController < ApplicationController
  skip_before_filter :logged_in_check
  def login
  
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save!
      redirect_to root_url, notice: "Thank you for joining!"

    end
  end

  def update_attributes
    
  end


end
