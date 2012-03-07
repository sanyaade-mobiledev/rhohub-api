class Rhohub::Base
  
  def errors
    @errors.strip
  end
  
  def create(data,options)
    begin
      resp = RestClient.post Rhohub.resource_url(options), data, {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
      @errors = String.new
      true
    rescue RestClient::RequestFailed => e
      @errors = e.response.body
      false
    end
    resp.body
  end
  
  # options = {:id => build_id, :app_id => app_id}
  def show(options)
    begin
      resp = RestClient.get Rhohub.resource_url(options), {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
      @errors = String.new
      true
    rescue RestClient::RequestFailed => e
      @errors = e.response.body
      false
    end
  end
  
  # options = {:id => build_id, :app_id => app_id}
  def delete(options)
    begin
      resp = RestClient.delete Rhohub.resource_url(options), {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
      @errors = String.new
      true
    rescue RestClient::RequestFailed => e
      @errors = e.response.body
      false
    end
  end
  
  # options = {:app_id => app_id}
  def list(options)
     begin
        resp = RestClient.get Rhohub.resource_url(options), {:HTTP_AUTHORIZATION => Rhohub.token, :content_type => :json, :accept => :json}
        @errors = String.new
        true
      rescue RestClient::RequestFailed => e
        @errors = e.response.body
        false
      end
      resp.body
  end
  
end