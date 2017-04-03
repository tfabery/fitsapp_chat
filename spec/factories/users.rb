FactoryGirl.define do
  factory :user do
    email 'test@test.com'
    password 'password'
    first_name 'First'
    last_name 'Last'
    role 0
    subscription
    chat
    message
  end
end
