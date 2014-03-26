class Account < ActiveRecord::Base
  def self.from_auth(auth_hash)
    account = Account.find_by_id(auth_hash.uid)
    account ||= Account.new(id: auth_hash.uid)
    
    account.access_token = auth_hash.credentials.token
    account.publishable_key = auth_hash.info.stripe_publishable_key
    account.save!
    
    account
  end
end