class UsersController < ApplicationController
  
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
    if session[:user_id] == @user.id
      if @user.update(user_params)
        action_success
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
  
  def action_success
    redirect_to @user, flash: {success: 'Yes!! Success'}
  end
end
