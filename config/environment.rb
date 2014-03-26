require 'bundler/setup'
Bundler.require :default, (ENV['RACK_ENV'] || 'development').to_sym
Dotenv.load

$:.unshift File.expand_path(File.dirname(__FILE__) + '/../')
$multitenant = (ENV['MULTITENANT'] == 'true')
$stdout.sync = true
$logger = Logger.new($stdout)