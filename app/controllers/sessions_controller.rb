class SessionsController < ApplicationController
  # layout 'unauthorised'
  
  def new
    render 'auth.html.erb'
  end
  
  def create
    if user = User.authenticate(params[:login], params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      redirect_to login_path
    end
  end
  
  def destroy
    reset_session
    redirect_to root_path
  end  
  
end
