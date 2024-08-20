class Beer < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :carts, through: :cart_items
  has_many :order_items, dependent: :destroy

  validates :title, :price, :description, :image, :abv, :ibu, :hops, :stripe_price_id, presence: true
end
