ENV['RACK_ENV'] = 'test'

require 'factory_girl'
require 'database_cleaner'
require 'omniauth'
require 'rack/test'
require 'pry'
# require 'pry-debugger'
require 'webmock/rspec'
require 'sidekiq'
require 'sidekiq/testing/inline'

OmniAuth.config.test_mode = true
WebMock.disable_net_connect!

require File.dirname(__FILE__) + '/../config/environment'

Dir[File.dirname(__FILE__) + "/support/*.rb"].each do |support_file|
  require support_file
end

RSpec.configure do |config|
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
  end

  config.before(:each) do
    DatabaseCleaner.start
    @original_logger = $logger
    $logger = Logger.new(nil)
    # $redis = Redis.new(db:7)
    # $redis.flushdb
  end

  config.after(:each) do
    DatabaseCleaner.clean
    $logger = @original_logger
  end

  config.include FactoryGirl::Syntax::Methods
  config.include Rack::Test::Methods
end