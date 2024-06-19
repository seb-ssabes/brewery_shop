Beer.destroy_all

beers = [
  { title: 'Autumm Ember - Amber Ale', price: 2.30 , description: 'Characterized by its balanced malt and hop flavors. Offering caramel, toasty, and biscuity malt notes.', image: 'Amber Ale.jpg', abv: 6.4, ibu: 30, hops: "Horizon, Cascade, Centennial" },
  { title: 'Majestic Midnight - Imperial Stout', price: 2.80 , description: 'A rich, full-bodied stout with chocolate and coffee notes.', image: 'Stout.jpg', abv: 7.3, ibu: 58, hops: "Magnum, Fuggle, East Kent Goldings" },
  { title: 'Liberty - American Pale Ale', price: 2.50, description: 'Refreshing and hoppy, featuring bright citrus aromas and a smooth, caramel malt finish.', image: 'American Pale Ale.jpg', abv: 6.2, ibu: 41, hops: "Cascade, Citra, Amarillo" },
  { title: 'Golden Horizon - IPA', price: 2.70, description: 'Bursting with hops like a tropical fruit orchestra—bold, bitter, and blissfully aromatic.', image: 'IPA.jpg', abv: 6.8, ibu: 60, hops: "Citra, Mosaic, El Dorado" },
  { title: 'Harvest Glow - Pale Ale', price: 2.50, description: 'Well-balanced pale ale with a smooth finish. The good-old classic one.', image: 'Pale Ale.jpg', abv: 5.5, ibu: 30, hops: "Amarillo, Cascade, Centennial" },
  { title: 'Noble Crest - Pilsner', price: 2.10, description: 'Classic pilsner with a crisp, clean taste. Perfect for a full day session.', image: 'Lager.jpg', abv: 4.5, ibu: 18, hops: "Saaz, Tettnang, Hallertau" },
  { title: 'Ruby Cascade - Red Ale', price: 2.30, description: 'Bold as a sunset, with caramel sweetness and a hoppy kick—like autumn in a glass.', image: 'Red Ale.jpg', abv: 5.5, ibu: 25, hops: "Cascade, Chinook" },
  { title: 'Sunlit Fields - Saison Pale Ale', price: 2.50, description: 'A farmhouse ale with fruity and spicy characteristics. The season\'s God Almighty.', image: 'Pale Ale.jpg', abv: 6.3, ibu: 35, hops: "Styrian Golding, Simcoe, Strisselspalt" },
  { title: 'Deep Heaven - Porter', price: 2.6, description: 'Like a bear hug from a coffee-loving lumberjack: rich, roasted, with hints of chocolate bliss.', image: 'Stout.jpg', abv: 5.8, ibu: 45, hops: "East Kent Goldings, Fuggle" },
  { title: 'Pure Springs - Lager', price: 2.00, description: 'A crisp high-five on a sunny day: clean, refreshing, with a hint of grainy goodness.', image: 'Lager.jpg', abv: 4.2, ibu: 10, hops: "Saaz, Perle" }
]

beers.each do |beer|
  Beer.create!(beer)
end

puts "Seeded #{Beer.count} beers."
