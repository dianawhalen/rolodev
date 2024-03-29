class ApplicationController < ActionController::Base
  helper_method :current_user, :signed_in?, :redirect_if_not_signed_in, :set_user

  private

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  end

  def signed_in?
    !!session[:user_id]
  end

  def redirect_if_not_signed_in
    redirect_to '/' if !signed_in?
  end

  def set_user
    @user = User.find(params[:id])
    redirect_to '/' if !@user || @user != current_user
  end
end
