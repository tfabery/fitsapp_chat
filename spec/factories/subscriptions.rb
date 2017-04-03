FactoryGirl.define do
  factory :subscription do
    association :user
    association :chat
  end
end
