class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Login successfully"
      redirect_to user
    else
      flash.now[:alert] = "Your email or password is incorrect"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Logout, goodbye have a great day ahead :D"
    redirect_to root_path
  end
end