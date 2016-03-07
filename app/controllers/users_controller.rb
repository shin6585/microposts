class UsersController < ApplicationController
  protect_from_forgery with: :exception
  before_action :current_user, only: [:edit, :update] 
  
  include SessionsHelper
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def edit
    @user = User.find(params[:id])
    if session[:user_id] == @user.id
    else
      render "show"
    end
  end
  
  def update
    @user = User.find(params[:id])
    if @current_user.id == @user.id
      if @user.update(user_params)
        redirect_to @user
      else
       render "edit"
      end
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
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :country, :profile)
  end
end
