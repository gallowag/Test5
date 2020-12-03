class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_non_user
    redirect_to '/' unless !current_user
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def require_designer
    redirect_to '/' unless (current_user && current_user.designer?)
  end

  def require_accepted_designer
    redirect_to '/' unless (current_user && current_user.accepted_designer?)
  end

  def require_accepted_designer_or_admin
    redirect_to '/' unless (current_user && current_user.accepted_designer_or_admin?)
  end

  def require_admin
    redirect_to '/' unless (current_user && current_user.admin?)
  end

end
