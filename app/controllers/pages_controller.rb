class PagesController < ApplicationController
before_action :require_user, only: [:success]

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

  def success
    @title = 'Congratulations!'
    @content = 'Your application is under review. Visit your profile page to see your current status.'
  end

end
