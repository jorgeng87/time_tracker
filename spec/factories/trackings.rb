# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :tracking do
    start "2013-10-13 00:13:54"
    stop "2013-10-13 00:13:54"
    description "Working on project A wireframes"
    association :user 
  end
end
