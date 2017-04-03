class Chat < ApplicationRecord
  attr_accessor :other_user
  has_many :messages, dependent: :destroy
  has_many :subscriptions, dependent: :destroy
  has_many :users, through: :subscriptions

  validates :identifier, presence: true, uniqueness: true, case_sensitive: false

  def name
    users.map { |user| user.full_name }.join(' and ')
  end
end
