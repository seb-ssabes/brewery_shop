class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :beer
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, presence: true

  def total_price
    beer.price * quantity
  end
end
