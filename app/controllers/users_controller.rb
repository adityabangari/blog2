class UsersController < ApplicationController

  def new
  @user = User.new
  end

  def create
  @user = User.new(user_params)
  if @user.save
    flash[:notice] = "You signed up successfully"
    flash[:color] = "Valid"
  else
    flash[:notice] = "Form is invalid"
    flash[:color] = "Invalid"
  end
    render "new"
  end



  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end

   before_action :save_login_state, :only => [:new, :create]

end
