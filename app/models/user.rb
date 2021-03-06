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

  def self.non_admin_except(user)
    where.not(id: user, role: :admin)
  end

  def self.all_except_admin()
    where.not(role: :admin)
  end
end
