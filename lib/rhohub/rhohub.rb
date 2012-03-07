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
    
    def self.resource_url(options = {})
      base_url = url
      base_url +=  "/#{options[:app_id]}"   if options.has_key?(:app_id)
      base_url += "/apps/#{options[:username]}" if options.has_key?(:username)
      base_url += "/builds/#{options[:id]}"  if options.has_key?(:id) && options.has_key?(:app_id)
      base_url += "/#{options[:id]}"  if options.has_key?(:id) && !options.has_key?(:app_id)
      base_url
    end
    
    def self.url
      ENV['rhohub_api_url']
    end
end