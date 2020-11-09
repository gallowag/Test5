class PagesController < ApplicationController
  def index
    @title = 'Welcome'
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
