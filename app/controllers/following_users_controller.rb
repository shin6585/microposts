class FollowingUsersController < ApplicationController
    protect_from_forgery with: :exception
  
  def show
    @user = User.find(params[:id])
    @following_users = @user.following_users.order(created_at: :desc)
  end
end