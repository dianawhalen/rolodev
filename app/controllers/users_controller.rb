class UsersController < ApplicationController
  before_action :redirect_if_not_signed_in, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

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
    redirect_to '/' if !@user
  end

  def edit
  end

  def update
    if @user.update(user_params)
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
      redirect_to root_path, notice: "Account deleted successfully."
    else
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
end
