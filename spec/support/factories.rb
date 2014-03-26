FactoryGirl.define do
  factory :account do
    sequence(:id){|n| "acct_#{n}"}
    sequence(:publishable_key){|n| "pk_#{n}" }
    sequence(:access_token){|n| "sk_#{n}" }
  end
end