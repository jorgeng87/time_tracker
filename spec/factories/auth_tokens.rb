# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :auth_token do
    token "AuthenticationToken"
    user
  end
end
