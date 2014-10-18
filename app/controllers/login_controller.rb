class LoginController < ApplicationController
  def index
      redirect_to "/" if session[:user_id].to_i > 0
  end

  def in
    username = params[:username]
    password = params[:password]
    
    user = User.where(name: username).first
    
    if user.nil?
      redirect_to "/login/?incorrect=user"
    elsif password == user.password 
      puts password
      puts user.password
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/login/?incorrect=password"
    end
  end

  def out
    session[:user_id] = 0
    redirect_to "/"
  end
end
