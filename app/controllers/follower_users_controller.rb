class FollowerUsersController < ApplicationController
    protect_from_forgery with: :exception
  
  def show
    @user = User.find(params[:id])
    @follower_users = @user.follower_users.order(created_at: :desc)
  end
end
