class StaticPagesController < ApplicationController
  before_action :current_user
  
  def home
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.feed_items.includes(:user).order(created_at: :desc)
    end
  end
end