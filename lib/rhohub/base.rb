class Rhohub::Base
   
  def self.create(data,options)
      resp = RestClient.post Rhohub.resource_url(options), data, {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
      resp.body
  end
  
  # options = {:id => build_id, :app_id => app_id}
  def self.show(options)
      resp = RestClient.get Rhohub.resource_url(options), {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
      resp.body
  end
  
  def self.delete(options)
      resp = RestClient.delete Rhohub.resource_url(options), {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
      resp.body
  end
  
  def self.list(options)
      resp = RestClient.get Rhohub.resource_url(options), {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
      resp.body
  end
  
end