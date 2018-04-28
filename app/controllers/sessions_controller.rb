class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user&.authenticate(params[:session][:password])
      flash[:notice] = "Thank you for signing in!"
      session[:user_id] = user.id
      redirect_to home_path
    else
      flash.now[:alert] = "Something went wrong. Please check your email or password!"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Signed out!"
    redirect_to home_path
  end

end
