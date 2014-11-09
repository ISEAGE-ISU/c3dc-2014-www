require 'net/http'
class ApplicationController < ActionController::Base
  before_filter do 
    adserver_uri = nil
    @url_of_ad_image = nil
    
    # Edit the following line and uncomment it 
    # adserver_uri = "http://<your_ad_server_goes_here>/index.php"
    
    unless adserver_uri.nil?
      @url_of_ad_image = Net::HTTP.get URI(adserver_uri)
      puts "Ad URL: #{@url_of_ad_image}"
    end
  end     
  def isCorrectUser user_id
    return false if session[:user_id].to_i == 0
    return true if session[:user_id] == user_id
    return false
  end
  def isLoggedIn
    return false if session[:user_id].to_i == 0
    return true
  end
  def isPoster
    return false if session[:user_id].to_i == 0
    return true if User.find(session[:user_id]).poster
    return false
    end
  def isModerator
    return false if session[:user_id].to_i == 0
    return true if User.find(session[:user_id]).moderator
    return false
  end
  def isAdministrator
    return false if session[:user_id].to_i == 0
    return true if User.find(session[:user_id]).administrator
    return false
  end
  def forbidden
    render(file: File.join(Rails.root, 'public/403.html'), status: 403, layout: false)
  end
end
