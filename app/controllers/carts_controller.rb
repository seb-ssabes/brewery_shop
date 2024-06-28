class CartsController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_cart, only: [:show]

  def show
    @cart = current_cart
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Cart not found"
  end
end
