class Beer < ApplicationRecord
  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :abv, presence: true
  validates :ibu, presence: true
  validates :hops, presence: true
end
