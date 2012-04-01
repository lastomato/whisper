class SessionsController < ApplicationController
  before_filter :require_login, :except => [:new, :create]

  def new
  end

  def create
    user = User.authenticate(params[:username], params[:password])

    if user
      session[:user_id] = user.number
      redirect_to blog_path, :notice => "Logged in!"
    else
      redirect_to login_path, :notice => "Invalid username or password!"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to blog_path, :notice => "Logged out!"
  end
end
