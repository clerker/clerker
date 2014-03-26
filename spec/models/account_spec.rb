require 'spec_helper'

describe Account do
  describe '.from_auth' do
    let(:auth_hash){ double('OmniAuth::AuthHash', uid: 'acct_abc123', credentials: double(token: 'sk_abc123'), info: double(stripe_publishable_key: 'pk_abc123')) }
    
    it 'should create a new account if none exists' do
      Account.should_receive(:find_by_id).with('acct_abc123').and_return(nil)
      Account.should_receive(:new).with(id: 'acct_abc123').and_call_original
      Account.any_instance.should_receive(:save!).and_return(true)
      
      Account.from_auth(auth_hash)
    end
    
    it 'should update an existing account if there is one' do
      account = build(:account, id: 'acct_abc123')
      Account.should_receive(:find_by_id).with('acct_abc123').and_return(account)
      Account.should_not_receive(:new)
      account.should_receive(:save!).and_return(true)
      
      Account.from_auth(auth_hash)
    end
  end
  
  it 'should generate a unique secret on creation' do
    a1 = Account.new
    a1.valid?
    expect(a1.secret).not_to be_nil
    a2 = Account.new
    a2.valid?
    expect(a2.secret).not_to eq(a1.secret)
  end
end