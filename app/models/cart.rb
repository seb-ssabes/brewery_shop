class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_many :beers, through: :cart_items

  def total_price
    cart_items.to_a.sum { |item| item.total_price}
  end

  def add_beer(beer, quantity = 1)
    current_item = cart_items.find_by(beer_id: beer.id)

    if current_item
      current_item.quantity += quantity.to_i
    else
      current_item = cart_items.build(beer_id: beer.id, quantity: quantity)
    end
    current_item
  end

  def total_units
    cart_items.sum(:quantity)
  end

  def total_beer_types
    cart_items.select(:beer_id).distinct.count
  end
end
