class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email (params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Logged In"
    else
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You are Signed Out"
  end
end
