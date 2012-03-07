require File.join(File.dirname(__FILE__), 'spec_helper')

describe Rhohub::Build do
  before(:all) do
    @build = Rhohub::Build.new
    @app   = Rhohub::App.new
  end
  
  before(:each) do
    @spec_helpers = SpecHelpers.new
    @spec_helpers.stub_build_methods
    @spec_helpers.stub_app_methods
  end
  context "build crud actions" do
    it "should make a GET request to get all builds for app" do
      @build.list({:app_id=> 4})
      WebMock.should have_requested(:get, Rhohub.resource_url({:app_id=> 4 }))
    end
  
    it "should make a GET request to get build status" do
      @build.show({:app_id=> 4,:id => 2})
      WebMock.should have_requested(:get, Rhohub.resource_url({:app_id=> 4, :id => 2 }))
    end
  
    it "should make a POST request to create build" do
      @build.create(nil,{:app_id => 4})
      WebMock.should have_requested(:post, Rhohub.resource_url({:app_id => 4}))
    end
  
    it "should make a DELETE request to delete build" do
      @build.delete({:app_id => 4, :id => 2})
      WebMock.should have_requested(:delete, Rhohub.resource_url({:app_id => 4, :id => 2}))
    end
   end
   
   context "app crud actions" do
     it "should make a GET request to get all apps for user" do
       @app.list()
       WebMock.should have_requested(:get, Rhohub.resource_url())
     end

     it "should make a GET request to get app status" do
       @app .show({:id => 2})
       WebMock.should have_requested(:get, Rhohub.resource_url({:id => 2 }))
     end

     it "should make a POST request to create an app" do
       @app .create({})
       WebMock.should have_requested(:post, Rhohub.resource_url({:username => 'testuser'}))
     end

     it "should make a DELETE request to delete app" do
       @app .delete({:id => 2})
       WebMock.should have_requested(:delete, Rhohub.resource_url({:id => 2}))
     end
   end
end