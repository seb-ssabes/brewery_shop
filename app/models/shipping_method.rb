class ShippingMethod < ApplicationRecord
  has_many :orders
end
