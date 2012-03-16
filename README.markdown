Rhohub API
==================
##Getting Started

This is a ruby interface to connect with the rhohub api. 

	$ gem install rhohub

	require 'rhohub'

##Rhohub Environment Variables

First of all you need to set your Rhohub token:

	Rhohub.token = "mytoken" or ENV['api_token'] = "mytoken"

Also, you can see your token any time with:

	Rhohub.token
	=> "mytoken"

You will also need to set the url of the rhobuild API:

    Rhohub.url = "http://path_to_rhohub.com" or ENV['rhohub_api_url'] = "http://path_to_rhohub.com"

You can get the path anytime with:
 
    Rhohub.url
    => ""http://path_to_rhohub.com""
	
##Rhohub Classes

You have two classes that you can work with: `Rhohub::Build` and `Rhohub::App`

	Rhohub # Rhohub main module
	
	Rhohub::App 
	Rhohub::Build
		
	  create(data, options) #create a new app/build
	  show(options)         # use this method to view app/build
	  delete(options)       # to delete a app/build
	  list(options)         # use this method to list builds

* data: A hash of build information is needed to create a new build. Ex:({:target_device => "device:bb:production-5.2", :version_tag => "master", :rhodes_version => "master"})
		
* options: A hash containing app_id and/or id(the build id).

##Build Functions

You can access your builds like this:

	Rhohub::Build.list({:app_id => 2})
	=> [{"id" : 2,"download_link" : "https://s3.amazonaws.com/bucket/uuid.zip", "status" : 'queued'},{"id" : 4,"download_link" : "https://s3.amazonaws.com/bucket/uuid.zip", "status" : 'queued'}]
	
	Rhohub::Build.create({:app_id => 2},{:target_device => "device:bb:production-5.2", :version_tag => "master", :rhodes_version => "master"})
	=> {"id" : 2, "download_link" : "https://s3.amazonaws.com/bucket/uuid.zip", "status" : 'queued'}
	
	Rhohub::Build.delete({:app_id => 2, :id => 3})
	=> {"text" : true}
	
	Rhohub::Build.show({:app_id=> 2, :id=> 3})
	=> {"id" : 2, "download_link" : "https://s3.amazonaws.com/bucket/uuid.zip", "status" : 'complete'}


##App Functions

You can access your apps like this:

    Rhohub::App.list()
	=> [{"id" : 2, "git_repo_url" : git@git.rhohub.com:username/somename-rhodes.git},{"id" : 4, "git_repo_url" : "git@git.rhohub.com:username/somename-rhodes.git"}]
	
	Rhohub::App.create({:name => "froggy"})
	=>{"rhodes_id":338,"rhodes_repo_url":"git@git-staging.rhohub.com:username/froggyAPIce4de31bcecb4dc492161b54d2989521-rhodes.git","rhosync_id":337,"rhosync_repo_url":"git@git-staging.rhohub.com:username/froggyAPIce4de31bcecb4dc492161b54d2989521-rhosync.git"}
	
	Rhohub::App.delete({:id => 2})
	=> {:text => true}
	
    Rhohub::App.show({:id => 2})	
	=>  {"id":337,"status":"queued","git_repo_url":"git@git-staging.rhohub.com:username/froggyAPIce4de31bcecb4dc492161b54d2989521-rhosync.git"}

##Errors

Any error/exceptions encountered from the Rhobuild API will return with the following structure:

=>{'text' : 'error message'}


##Meta
Created and maintained by [lucas campbell](https://github.com/lucascampbell) and [Lars Burgess](https://github.com/larsburgess).

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).