class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    beer = Beer.find(params[:beer_id])
    @cart_item = @cart.add_beer(beer)

    if @cart_item.save
      redirect_to cart_path(@cart), notice: 'Beer was added to your bag.'
    else
      redirect_to beers_path, alert: 'Unable to add Beer to bag' + @cart_item.errors.full_messages.join(', ')
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to cart_path(@cart), noticUnae: 'Beer was updated'
    else
      redirect_to cart_path(@cart), alert: 'Unable to update Beer'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path(@cart), notice: 'Beer was removed'
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
