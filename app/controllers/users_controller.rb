class UsersController < ApplicationController

before_action :require_non_user, only: [:new]
before_action :require_user, only: [:show]

def show
  @user = current_user
  if @user.privilege == 0
    @role = 'User'
  elsif @user.privilege == 1
    @role = 'Designer - Pending'
  elsif @user.privilege == 2
    @role = 'Designer - Approved'
  elsif @user.privilege == 3
    @role = 'Designer - Rejected'
  elsif @user.privilege == 4
    @role = 'Admin'
  end
end

def new
  @user = User.new
  @privilege = 0
end

def create
  @user = User.new(user_signup_params)
  if @user.save
    session[:user_id] = @user.id
    redirect_to '/'
  else
    redirect_to '/signup'
  end
end

private def user_signup_params
    params.require(:user).permit(:username, :email, :password, :privilege)
end

end
