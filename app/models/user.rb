class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :carts, dependent: :destroy
  has_many :orders
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }

  pay_customer
end
