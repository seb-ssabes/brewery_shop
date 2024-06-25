class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update, :destroy]

  def show
    @cart = current_cart
  end

  private

  def set_cart
    @cart = Cart.find(params[:id])
  end
end
