class UsersController < ApplicationController
  before_action :set_user,  only: [:show, :edit, :update]
  before_action :logged_in_user, only: [:show, :edit, :update]
  before_action :authenticate!, only: [:edit, :update]
  
  
  def show
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      action_success
    else
     render "edit"
    end
  end
  
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render "new"
    end
  end
  
  def feed_items
    Micropost.where(user_id: following_user_ids + [self.id])
  end
  
  def favorite_microposts
    Micropost.where(user_id: user_params[:id])
  end

  
  private

  # get parameters for sinup
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  # get parameters for profile editing
  def user_profile
    params.require(:user).permit(:name, :email, :profile, :country, :password, :password_confirmation)
  end

  # get a user instance with :id parameter
  def set_user
    @user = User.find(params[:id])
  end

  # check current_user is editing self ?
  def authenticate!
    if @user != current_user
      redirect_to root_url, flash: { danger: "不正なアクセス" }
    end
  end
  
  def action_success
    redirect_to @user, flash: {success: 'Yes!! Success'}
  end
  
  
end
