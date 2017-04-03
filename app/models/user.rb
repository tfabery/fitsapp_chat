class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :subscriptions
  has_many :chats, through: :subscriptions

  def full_name
    first_name + ' ' + last_name
  end

  def self.all_except(user)
    where.not(id: user)
  end
end
