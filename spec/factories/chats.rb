require 'securerandom'

FactoryGirl.define do
  factory :chat do
    identifier SecureRandom.hex
    association :subscription
    association :user
    association :message
  end
end
