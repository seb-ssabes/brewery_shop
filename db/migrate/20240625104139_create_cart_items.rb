class CreateCartItems < ActiveRecord::Migration[7.1]
  def change
    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references null: false, foreign_key: true
      # t.references :product, null: false, foreign_key: true product NEEDS TO GO BACK AFTER DEPLOYMENT

      t.integer :quantity

      t.timestamps
    end
  end
end
