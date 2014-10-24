require 'net/http'
class ApplicationController < ActionController::Base
  #@adserver_uri = "http://ads.teamN.isucdc.com/get_ad_url.php"
  @adserver_uri = nil
  
  
  @url_of_ad_image = nil
  before_filter do 
    unless @adserver_uri.nil?
      @url_of_ad_image = Net::HTTP.get URI(@adserver_uri)
    end
  end
end
