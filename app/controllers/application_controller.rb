require 'net/http'
class ApplicationController < ActionController::Base
  before_filter do 
    adserver_uri = nil
    @url_of_ad_image = nil
    
    # Edit the following line and uncomment it 
    # adserver_uri = "http://ads.teamN.isucdc.com/index.php"
    
    unless adserver_uri.nil?
      @url_of_ad_image = Net::HTTP.get URI(adserver_uri)
    end
  end
end
