class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :logged_in?

  private
    def current_user
      @current_user ||= User.find_by_number(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def require_login
      unless logged_in?
        redirect_to login_path, :notice => "You must be logged in!"
      end
    end
end
