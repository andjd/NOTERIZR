class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def logged_in?
    !!current_user
  end


  def current_user

    @current_user ||= User.find_by_session_id(session[:session_token])
    return @current_user unless @current_user.nil?

    nil
  end

  def login(user)
    user.reset_session!
    session[:session_token] = user.session_id
    redirect_to user_url(user)
  end


end
