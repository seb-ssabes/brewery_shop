class CartsController < ApplicationController
  before_action :set_cart, only: [:show]

  def show
    @cart
  end

  private

  def set_cart
    @cart = current_cart
  end
end
