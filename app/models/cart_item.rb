class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :beer

  validates :quantity, numericality: { only_integer: true, greater_than: 0 }
  validates :beer_id, presence: true
  validates :cart_id, presence: true

  def total_price
    beer.price * quantity
  end
end
