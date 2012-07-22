class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :logged_in_check, :has_community?
    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def logged_in_check
      if !current_user
        redirect_to :controller => :pages, :action => :welcome
      end
    end


    def has_community?
      if current_user
        if current_user.community_id == '' or current_user.community_id == nil
          redirect_to community_select_path, :notice => "You must select a community."
        else
          
      end
    end
    end 
    helper_method :current_user, :has_community?, :logged_in_check
end
