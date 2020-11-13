class PagesController < ApplicationController
  def index
    if current_user
      @title = 'Welcome, ' + current_user.username
    else
      @title = 'Welcome'
    end
  end
  def about
    @title = 'About Us'
    @content = 'Little blurb mom is going to write'
  end

  def opportunities
    @title = 'Opportunities'
    @content = 'Little blurb mom is going to write'
  end
end
