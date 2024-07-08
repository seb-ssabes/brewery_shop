class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items
  validates :status, presence: true
  validates :total_price, presence: true
  validates :name, :last_name, :email, :phone, :address, :phone, :country, :city, :region, :post_code, presence: true

  def total_price
    order_items.sum(&:total_price)
  end
end
