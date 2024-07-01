class UpdateCartItemsForBeer < ActiveRecord::Migration[7.1]
  def change
    remove_reference :cart_items, :product, foreign_key: true
    add_reference :cart_items, :beer, foreign_key: true
  end
end
