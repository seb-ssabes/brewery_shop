class AddStripePriceIdToBeer < ActiveRecord::Migration[7.1]
  def change
    add_column :beers, :stripe_price_id, :string
  end
end
