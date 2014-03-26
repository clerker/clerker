require 'sinatra'

module Multitenant
  class Auth < Sinatra::Base
    get '/auth/stripe/callback' do
      account = Account.from_auth(env['omniauth.auth'])
      session[:account_id] = account.id
      redirect '/'
    end
  end
end