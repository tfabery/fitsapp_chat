FactoryGirl.define do
  factory :message do
    content 'Hi!'
    association :user
    association :chat
  end
end
