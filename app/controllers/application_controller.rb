class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate
    if session[:user_id]
      return true
    else
      redirect_to login_path
    end    
  end
    
end
