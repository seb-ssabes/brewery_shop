class Order < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :shipping_method

  has_many :order_items, dependent: :destroy
  accepts_nested_attributes_for :order_items

  validates :name, :last_name, :email, :phone, :address, :country, :city, :region, :post_code, :status, :shipping_method_id, :total_price, presence: true

  def items_subtotal
    order_items.sum { |item| item.total_price }
  end
end
