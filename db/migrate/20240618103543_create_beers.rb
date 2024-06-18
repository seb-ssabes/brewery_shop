class CreateBeers < ActiveRecord::Migration[7.1]
  def change
    create_table :beers do |t|
      t.string :title
      t.decimal :price
      t.text :description
      t.string :image
      t.decimal :abv
      t.integer :ibu
      t.text :hops

      t.timestamps
    end
  end
end
