class UsersController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:edit, :update, :destroy]
  before_action :set_user, only: [:edit, :update, :destroy]

  def index
    redirect_if_not_signed_in
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user != current_user
      flash[:alert] = "You are not authorized to perform this action."
      redirect_back(fallback_location: root_path)
    elsif @user.update(user_params)
      flash[:notice] = "Account updated successfully."
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    if user == current_user
      session[:user_id] = nil
      user.destroy
      flash[:notice] = "Account deleted successfully."
      redirect_to root_path
    else
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to root_path
    end
  end

  private

  def user_params
    if params[:user][:from_omniauth] == "true"
      params.require(:user).permit(:username, :email)
    else
      params.require(:user).permit(:username, :email, :password, :password_confirmation)
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
