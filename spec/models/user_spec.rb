require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many :messages }
  it { should have_many :subscriptions }
  it { should have_many :chats }
  it { should define_enum_for :role }
end
