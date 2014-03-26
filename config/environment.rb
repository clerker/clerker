require 'bundler/setup'
Bundler.require :default, (ENV['RACK_ENV'] || 'development').to_sym
require 'active_support/core_ext'
Dotenv.load

$:.unshift File.expand_path(File.dirname(__FILE__) + '/../')
$multitenant = (ENV['MULTITENANT'] == 'true')
$stdout.sync = true
$logger = Logger.new($stdout)

require 'yaml'
connection_details = YAML::load(File.open('config/database.yml'))[ENV['RACK_ENV']]
ActiveRecord::Base.establish_connection(connection_details)

require 'app/models/_index'