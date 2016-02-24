class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    params_user = params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
    @user = User.new params_user
    if @user.save
      redirect_to root_path, notice: "Welcome to Code Snippets"
    else
      render :new
    end
  end
end
