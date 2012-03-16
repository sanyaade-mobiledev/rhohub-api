$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rhohub'
require 'rspec'
require 'webmock/rspec'
include WebMock::API

class SpecHelpers
  
  def initialize
      ENV['rhohub_token'] = "mytoken"
      WebMock.disable_net_connect!
  end
  
  def stub_build_methods
    stub_request(:get, Rhohub.resource_url({:app_id => 4},'builds')).to_return({:body => [{:id=> 4}].to_json})
    stub_request(:get, Rhohub.resource_url({:app_id => 4, :id => 2},'builds')).to_return({:body => [{:id=> 4,:status => 'complete'}].to_json})
    stub_request(:delete, Rhohub.resource_url({:app_id => 4,:id => 2},'builds')).to_return({:body => [{:text => true}].to_json})
    stub_request(:post, Rhohub.resource_url({:app_id => 4},'builds')).to_return({:body => [{:id => 4, :status => 'pending'}].to_json})
  end
  
  def stub_app_methods
    stub_request(:get, Rhohub.resource_url({},'apps')).to_return({:body => [{:id=> 4}].to_json})
    stub_request(:get, Rhohub.resource_url({:app_id => 2},'apps')).to_return({:body => [{:id=> 4,:status => 'complete'}].to_json})
    stub_request(:delete, Rhohub.resource_url({:app_id => 2},'apps')).to_return({:body => [{:text => true}].to_json})
    stub_request(:post, Rhohub.resource_url({},'apps')).to_return({:body => [{:id => 4, :status => 'pending'}].to_json})
  end
  
end