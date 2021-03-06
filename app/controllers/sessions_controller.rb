class SessionsController < ApplicationController
  
  def new
  end
  
  def create
    user = User.find_by_email(params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/admin/uploads'
    else
    # If user's login doesn't work, send them back to the login form.
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
  
end
