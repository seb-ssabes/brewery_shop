class CartItemsController < ApplicationController
  before_action :set_cart
  before_action :set_cart_item, only: [:update, :destroy]

  def create
    product = Product.find(params[:product_id])
    @cart_item = @cart.add_product(product)

    if @cart_item.save
      redirect_to @cart, notice: 'Beer was added to your bag.'
    else
      redirect_to products_path, alert: 'Unable to add Beer to bag'
    end
  end

  def update
    if @cart_item.update(cart_item_params)
      redirect_to @cart, notice: 'Beer was updated'
    else
      redirect_to @cart, alert: 'Unable to update Beer'
    end
  end

  def destroy
    @cart_item.destroy
    redirect_to @cart, notice: 'Beer was removed'
  end

  private

  def set_cart
    @cart = current_cart
  end

  def set_cart_item
  @cart_item = @cart.cart_items.find(params[:id])
  end

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
