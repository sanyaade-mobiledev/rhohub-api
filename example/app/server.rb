require 'sinatra/base'
require 'json'
require './app/server_helper'

module BuildAPI
  class << self
    ROOT_DIR = File.dirname(File.expand_path(__FILE__)) unless defined? ROOT_DIR
    def root_path(*args)
      File.join(ROOT_DIR, *args)
    end
  end
  
  class Server < Sinatra::Base
    set :views,   BuildAPI::root_path("views")
    set :public_folder,  BuildAPI::root_path("../public")
    set :static, true
   
    helpers do
      include ServerHelper
    end
  
    get '/' do
      @tab = 1
      erb :index
    end
    
    get '/index' do
      @tab = 1
      erb :index
    end
    
    get '/apps' do
      @tab = 2
      erb :apps
    end
    
    get '/builds' do
      @tab = 3
      erb :builds
    end
  
    post "/set_url" do
       Rhohub.url = params['id']
       content_type :json
       { :success => true }.to_json
     end

     post "/set_token" do
       Rhohub.token = params['id']
       content_type :json
       { :success => true }.to_json
     end

     post "/create_app" do
       name = params['id']
       resp = Rhohub::App.create({:app => {:name => name}}.to_json)
       content_type :json
       { :resp => resp }.to_json
     end

     get "/show_app" do
       app_id = params['id']
       resp = Rhohub::App.show({:app_id => app_id})
       content_type :json
       { :resp => resp }.to_json
     end

     get "/list_app" do
        resp = Rhohub::App.list()
        content_type :json
        { :resp => resp }.to_json
     end

     delete "/delete_app" do
       app_id = params['id']
       resp   = Rhohub::App.delete({:app_id => app_id})
       content_type :json
       { :resp => resp }.to_json
     end
     
     post "/create_build" do
       app_id         = params['id']
       target_device  = params['targetDevice']
       version_tag    = params['versionTag']
       rhodes_version = params['rhodesVersion']
       
       resp           = Rhohub::Build.create({:app_id => app_id},{:build => {'target_device' => target_device, 'version_tag' => version_tag,
                                                                  'rhodes_version' => rhodes_version}}.to_json)
       content_type :json
       { :resp => resp }.to_json
     end

     get "/show_build" do
       app_id = params['app_id']
       id     = params['id']
       resp   = Rhohub::Build.show({:app_id => app_id, :id => id})
       content_type :json
       { :resp => resp }.to_json
     end

     get "/list_build" do
        app_id = params['id']
        resp = Rhohub::Build.list({:app_id => app_id})
        content_type :json
        { :resp => resp }.to_json
     end

     delete "/delete_build" do
       app_id = params['app_id']
       id     = params['id']
       resp   = Rhohub::Build.delete({:app_id => app_id, :id => id})
       content_type :json
       { :resp => resp }.to_json
     end
  end
end