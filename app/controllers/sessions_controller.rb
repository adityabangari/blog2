class SessionsController < ApplicationController
  def login
    # login form
  end

  def login_attempt

    authorized_user = User.authenticate(params[:username_or_email], params[:login_password])

if authorized_user
  session[:user_id] = authorized_user.id
  flash[:notice]="Welcome #{authorized_user.username}"
  redirect_to url_for(:controller => :articles, :action => :index)
else

  flash[:notice]="invalid username or password"
  flash[:color]="Invalid"
  render "login"


end
  end






  def home
  end

  def profile
  end

  def setting
  end





  def logout
    session[:user_id] = nil
    redirect_to root_path
  end

   before_action :authenticate_user, :only => [:home, :profile, :setting]
   before_action :save_login_state, :only => [:login, :login_attempt]


end
