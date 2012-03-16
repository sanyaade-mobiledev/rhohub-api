require File.join(File.dirname(__FILE__), 'spec_helper')

describe Rhohub::Build do
  
  before(:each) do
    @spec_helpers = SpecHelpers.new
    @spec_helpers.stub_build_methods
  end
  
    it "should make a GET request to get all builds for app" do
      Rhohub::Build.list({:app_id=> 4})
      WebMock.should have_requested(:get, Rhohub.resource_url({:app_id=> 4 }))
    end
  
    it "should make a GET request to get build status" do
      Rhohub::Build.show({:id => 4})
      WebMock.should have_requested(:get, Rhohub.resource_url({:id => 4 }))
    end
  
    it "should make a POST request to create build" do
      Rhohub::Build.create(nil)
      WebMock.should have_requested(:post, Rhohub.resource_url())
    end
  
    it "should make a DELETE request to delete build" do
      Rhohub::Build.delete({:id => 2})
      WebMock.should have_requested(:delete, Rhohub.resource_url({:id => 2}))
    end
  
end