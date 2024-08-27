class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    beer = Beer.find(params[:beer_id])
    @cart_item = @cart.add_beer(beer)

    respond_to do |format|
      if @cart_item.save
        format.html {redirect_to request.referrer}
      else
        format.html { redirect_to request.referrer }
      end
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_path(@cart)
    else
      redirect_to cart_path(@cart)
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(@cart)
  end

  private

  def set_cart
    @cart = current_cart
  end

  def set_cart_item
    if params[:id]
      @cart_item = @cart.cart_items.find(params[:id])
    else
      beer = Beer.find(params[:beer_id])
      @cart_item = @cart.cart_items.find_or_initialize_by(beer: beer)
    end
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
