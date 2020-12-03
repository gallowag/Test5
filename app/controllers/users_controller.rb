class UsersController < ApplicationController

before_action :require_non_user, only: [:new]
before_action :require_user, only: [:show, :apply]
before_action :require_admin, only: [:index]

def index
  @title = 'All Designers'
  @users = User.all

  @up = 2
  @down = 3
end

def show
  @title = 'My Account'
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
  @title = 'Sign in'
  @user = User.new
  @privilege = 0
end

def create
  @user = User.new(user_signup_params)
  if @user.save
    session[:user_id] = @user.i
    redirect_to '/'
  else
    redirect_to '/signup'
  end
end

def apply
  @user = current_user
  @privilege = 1

  @title = 'Become a Designer'
  @content = 'Please reach out to apply@keenanproject.com before applying'
end

def edit
  @title = 'Edit Profile'
  @user = current_user
end

def update
  if params[:commit] == "Apply"
    @user = current_user
    if @user.update_attributes(user_update_params)
      redirect_to '/success'
    else
      redirect_to '/apply'
    end
  elsif params[:commit] == "Accept" || params[:commit] == "Reject"
    @user = User.find(params[:id])
    if @user.update_attributes(user_update_params)
      redirect_to designers_path
    else
      redirect_to '/'
    end
  elsif params[:commit] == "Submit Changes"
    @user = current_user
    if @user.update_attributes(user_update_params)
      redirect_to '/profile'
    else
      redirect_to '/edit'
    end
  end
end

private
  def user_signup_params
      params.require(:user).permit(:username, :email, :password, :privilege)
  end

  def user_update_params
      params.require(:user).permit(:username, :email, :password, :privilege)
  end

end
