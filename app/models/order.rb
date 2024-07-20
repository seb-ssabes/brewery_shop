class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shipping_method

  has_many :order_items, dependent: :destroy

  accepts_nested_attributes_for :order_items

  validates :status, presence: true
  validates :total_price, presence: true
  validates :name, :last_name, :email, :phone, :address, :phone, :country, :city, :region, :post_code, presence: true

  def total_price
    items_total = order_items.sum { |item| item.total_price }
    shipping_cost = shipping_method&.price.to_f
    items_total + shipping_cost
  end
end
