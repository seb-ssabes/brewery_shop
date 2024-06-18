class Beer < ApplicationRecord
  validates :title, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :abv, presence: true
  validates :ibu, presence: true
  validates :hops, presence: true
end
