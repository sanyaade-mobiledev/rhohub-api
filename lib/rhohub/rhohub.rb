module Rhohub
  
  def self.token=(token)
      if token
        ENV['rhohub_token'] = token
      else
        raise "Invalid RhoGallery credentials. correct format: {:username => 'your username', :token => 'your rhogallery token'}"
      end
    end

    def self.token
      if ENV['rhohub_token']
        ENV['rhogallery_token']
      else
        raise "You must set your rhohub api token see README file"
      end
    end
    
    def self.resource_url(options = "")
      ENV['rhohub_api_url'].gsub(/:app_id/, options[:app_id])
    end
end