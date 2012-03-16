class Rhohub::Base
   
  def self.catch_all
    begin
      raise Exception.new "you need to enter an api_token first ex:ENV['api_token']=sometoken" unless Rhohub.token
      yield
    rescue Exception => e
      puts e.message
      throw :halt, [503, {:text => "Unable to complete request: #{e.message}"}.to_json]
    end
  end
   
  def self.create(options,data,resource)
    resp = RestClient.post Rhohub.resource_url(options,resource), data, {:AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
    resp.body
  end
  
  # options = {:id => build_id || app_id}
  def self.show(options,resource)
    resp = RestClient.get Rhohub.resource_url(options,resource), {:AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
    resp.body
  end
  # options = {:id => build_id || app_id}
  def self.delete(options,resource)
    resp = RestClient.delete Rhohub.resource_url(options,resource), {:AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
    resp.body
  end
  
  # options = {:id =>  app_id || nil}
  def self.list(options,resource)
    resp = RestClient.get Rhohub.resource_url(options,resource), {:AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
    resp.body
  end
  
end