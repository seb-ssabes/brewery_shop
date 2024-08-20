class ShippingMethod < ApplicationRecord
  has_many :orders, dependent: :destroy
end
