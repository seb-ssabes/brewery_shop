class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.references null: false, foreign_key: true
      # t.references :user, null: false, foreign_key: true USER NEEDS TO GO BACK AFTER DEPLOYMENT


      t.timestamps
    end
  end
end
