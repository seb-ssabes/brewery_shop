class BeersController < ApplicationController
  before_action :set_beer, only: [:show, :add_to_cart]

  def index
    @beers = Beer.all
  end

  def show
    @beer = Beer.find(params[:id])
  end

  def add_to_cart
    @cart = current_cart
    @cart_item = @cart.cart_items.find_or_initialize_by(beer_id: @beer.id)
    if @cart_item.new_record?
      @cart_item.quantity = 1
    else
      @cart_item.quantity += 1
    end

    if @cart_item.save
      redirect_to cart_path, notice: "Beer added to your cart."
    else
      redirect_to @beer, alert: "There was an issue adding the beer to your cart."
    end
  end

  private

  def set_beer
    @beer = Beer.find(params[:id])
  end
end
