class AddShippingMethodToOrders < ActiveRecord::Migration[7.1]
  def change
    add_reference :orders, :shipping_method, null: false, foreign_key: true
  end
end
