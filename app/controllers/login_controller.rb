class LoginController < ApplicationController
  def index
      redirect_to "/" if session[:user_id].to_i > 0
  end

  def in
    username = params[:username]
    password = params[:password]
    
    user = User.find_by :name, @username
    
    if password == user.password 
      redirect_to "/"
    end
  end

  def out
    session[:user_id] = 0
  end
end
