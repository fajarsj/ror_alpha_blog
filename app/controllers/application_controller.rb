class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?

  def current_user
    # ||= equal to if current_user exist return current_user otherwise User.find(session[:user_id]) if session[:user_id]
    @currenct_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end
end
