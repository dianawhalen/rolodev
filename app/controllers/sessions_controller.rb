class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :github

  def home
  end

  def new
  end

  def create
    if params[:provider] == 'github'
      @user = User.from_omniauth(auth)
      @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:message] = "We're sorry, some of the information you entered was incorrect, please try again."
        redirect_to signin_path
      end
    end
  end

  # def github
  #   # binding.pry
  #   @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
  #     user.username = auth["info"]["nickname"]
  #     user.password = SecureRandom.hex(10)
  #   end
  #   if @user.save
  #     session[:user_id] = @user.id
  #     redirect_to user_path(@user)
  #   else
  #     redirect_to '/'
  #   end
  # end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end
end
