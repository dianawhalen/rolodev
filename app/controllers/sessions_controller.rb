class SessionsController < ApplicationController
  def home
  end

  def new
  end

  def create
    user = User.find_by(username: params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:message] = "We're sorry, some of the information you entered was incorrect, please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
