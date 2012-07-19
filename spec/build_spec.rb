require File.join(File.dirname(__FILE__), 'spec_helper')

describe Rhohub::Build do
  
  before(:each) do
    @spec_helpers = SpecHelpers.new
    @spec_helpers.stub_build_methods
  end
  
    it "should make a GET request to get all builds for app" do
      Rhohub::Build.list({:app_id=> 4})
      WebMock.should have_requested(:get, Rhohub.resource_url({:app_id=> 4 },'builds'))
    end
  
    it "should make a GET request to get build status" do
      Rhohub::Build.show({:app_id => 4,:id => 2})
      WebMock.should have_requested(:get, Rhohub.resource_url({:id => 2,:app_id => 4 },'builds'))
    end
  
    it "should make a POST request to create build" do
      Rhohub::Build.create({:app_id => 4},{:build=>{'target_device'=>"Android", 'version_tag' => 'master', 'rhodes_version' => 'master' }})
      WebMock.should have_requested(:post, Rhohub.resource_url({:app_id => 4},'builds'))
    end
  
    it "should make a DELETE request to delete build" do
      Rhohub::Build.delete({:app_id => 4, :id => 2})
      WebMock.should have_requested(:delete, Rhohub.resource_url({:app_id => 4, :id => 2},'builds'))
    end
    
    it "should make a platform request to platforms build" do
      Rhohub::Build.platforms
      WebMock.should have_requested(:get, Rhohub.resource_url({},'platforms'))
    end
  
end