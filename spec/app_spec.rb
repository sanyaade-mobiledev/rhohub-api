$:.unshift File.expand_path(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'rhogallery'
require 'rspec'
require 'webmock/rspec'
include WebMock::API

class SpecHelpers
  
  def initialize
      ENV['rhohub_token'] = "some_uuid_token"
      WebMock.disable_net_connect!
  end
  
  def stub_app_methods
    stub_request(:get, Rhohub.resource_url(:app_id => 4)).
          to_return({:body => [{'id'=4}].to_json})
  end
  
  def stub_build_methods
    stub_request(:get, Rhohub.resource_url(:app_id => 4)).
          to_return({:body => [{'id'=4}].to_json})
  end