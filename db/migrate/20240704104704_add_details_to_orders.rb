class AddDetailsToOrders < ActiveRecord::Migration[7.1]
  def change
    add_column :orders, :name, :string
    add_column :orders, :last_name, :string
    add_column :orders, :email, :string
    add_column :orders, :address, :string
    add_column :orders, :phone, :string
    add_column :orders, :country, :string
    add_column :orders, :city, :string
    add_column :orders, :post_code, :string
    add_column :orders, :region, :string
  end
end
