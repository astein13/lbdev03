class PagesController < ApplicationController
   skip_before_filter :logged_in_check
   
  def welcome
  end

  def contact
  end

  def faq
  end

  def press
  end
end
