require File.join(File.dirname(__FILE__), 'spec_helper')

 describe Rhohub::App do

   before(:each) do
     @spec_helpers = SpecHelpers.new
     @spec_helpers.stub_app_methods
   end
 
   it "should make a GET request to get all apps for user" do
     Rhohub::App.list()
     WebMock.should have_requested(:get, Rhohub.resource_url())
   end

   it "should make a GET request to get app status" do
     Rhohub::App.show({:id => 2})
     WebMock.should have_requested(:get, Rhohub.resource_url({:id => 2 }))
   end

   it "should make a POST request to create an app" do
     Rhohub::App.create()
     WebMock.should have_requested(:post, Rhohub.resource_url())
   end

   it "should make a DELETE request to delete app" do
     Rhohub::App.delete({:id => 2})
     WebMock.should have_requested(:delete, Rhohub.resource_url({:id => 2}))
   end
 
 end