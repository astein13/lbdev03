class OrganizationsController < ApplicationController
  skip_before_filter :logged_in_check, :has_community?
  def login
  
  end

  def create
    @organization = Organization.new(params[:organization])
    if @organization.save!
      redirect_to liveboard_path, notice: "Thank you for joining!"

    end
  end

  def register
    @organization = Organization.new(params[:organization])
    @email = params[:email]
  end

  def update
    @organization = Organization.find(current_user.id)
    if @organization.update_attributes!(params[:organization])
      redirect_to liveboard_path, notice: "Your community has been added."
    end
  end


end
