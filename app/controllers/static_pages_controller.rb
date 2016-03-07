class StaticPagesController < ApplicationController
  before_action :current_user
  
  def home
    @micropost = current_user.microposts.build if logged_in?
  end
end