Rhohub API
==================
##Getting Started

This is a ruby interface to connect with the rhohub api. 

	$ gem install rhohub

	require 'rhohub'

##Rhohub Token

First of all you need to set your Rhohub token:

	Rhohub.token = "mytoken"

Also, you can see your credentials any time with:

	Rhohub.token
	=> "mytoken"

##Rhohub Classes

Then you have two classes that you can work with: `Rhohub::Build` and `Rhohub::App`

	Rhohub # Rhohub main module
	
	Rhohub::App 
	Rhohub::Build
		
	  create(data, options) 	# create a new app/build
	  show(options)       # use this method to view app/build
	  delete(options)     # to delete a app/build
	  list(options)       # use this method to list builds

* data: A hash of build information to needed to create new build. Ex:({:target_device => "device:bb:production-5.2", :version_tag => "master", :rhodes_version => "master"})
		
* options: A hash containing app_id and/or id(the build id).  Every call will need to be passed an app_id.

##Get Builds

You can get all your builds like this:

	Rhohub::Build.list({:app_id => 2})
	=> [{},{},{}]
	
	Rhohub::Build.show({:id=> 3})
	=> [{}]


##Create new App/Build

You can create new App and/or Build with your own attributes.

	app = Rhohub::App.create({
		:name => "somename",:app_type = "rhodes"
	})
	=> {'id'=>4, :git_repot_url => git@git.rhohub.com:username/somename-rhodes.git}
	
	build = Rhohub::Build.new({:name => "new_build"})
	=> {'id'=>3}
	
	group.save
	=> true

##See Errors


##Meta
Created and maintained by [lucas campbell](https://github.com/lucascampbell) and [Lars Burgess](https://github.com/larsburgess).

Released under the [MIT License](http://www.opensource.org/licenses/mit-license.php).