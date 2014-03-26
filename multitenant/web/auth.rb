require 'sinatra'

module Multitenant
  class Auth < Sinatra::Base
    get '/auth/stripe/callback' do
      env['omniauth.auth'].to_hash.to_json
    end
  end
end