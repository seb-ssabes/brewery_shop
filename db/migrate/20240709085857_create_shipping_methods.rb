class CreateShippingMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :shipping_methods do |t|
      t.string :name
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
