path = File.join(File.dirname(__FILE__),'..','lib')
$:.unshift path

require 'rubygems'
require 'bundler'

Bundler.require

require './app/server'

require '../lib/rhohub.rb'

run BuildAPI::Server.new