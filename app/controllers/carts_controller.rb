class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    if @cart.cart_items.empty?
      flash.now[:notice] = "Your cart is currently empty."
    end
  end

  private

  def set_cart
    @cart = current_cart
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: "Cart not found" unless @cart
  end
end
