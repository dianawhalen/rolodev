class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create

  def home
  end

  def new
  end

  def create
    if params[:provider] == 'github'
      @user = User.from_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to root_path, notice: "Logged in successfully!"
      else
        redirect_to signin_path, alert: "We're sorry, some of the information you entered was incorrect, please try again."
      end
    end
  end

  def destroy
    session.clear
    redirect_to root_path, notice: "Logged out successfully!"
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
