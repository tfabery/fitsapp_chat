class User < ApplicationRecord
  enum role: [:user, :trainer, :admin]

  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

  validates :role, inclusion: { in: roles.keys }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def full_name
    first_name + ' ' + last_name
  end

  def self.all_except(user)
    where.not(id: user)
  end
end
