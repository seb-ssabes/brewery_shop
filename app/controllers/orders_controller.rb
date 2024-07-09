class OrdersController < ApplicationController
  layout 'checkout', only:[:new]
  before_action :set_order, only: [:show]

  def new
    @order = Order.new
    @shipping_methods = ShippingMethod.all
    @order_items = current_cart.cart_items.map do |item|
      @order.order_items.build(beer: item.beer, quantity: item.quantity, price: item.beer.price)
    end
  end

  def create
    @order = current_user.orders.new(order_params)
    @order.shipping_method = ShippingMethod.find(params[:shipping_method_id])
    @order.total_price = calculate_total_price

    if @order.save
      session[:cart_id] = nil
      redirect_to @order, notice: 'Order was succesfullt created'
    else
      @shipping_methods = ShippingMethod.all
      render :new
    end
  end

  def update_total_price
    @order = Order.new(order_params)
    @order.total_price = calculate_total_price

    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.replace('total_price', partial: 'orders/total_price', locals: { total_price: @order.total_price }) }
    end
  end

  def showOrder
    @order = Order.find(params[:id])
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:status, :name, :email, :shipping_method_id, order_items_attributes: [:id, :quantity, :beer_id, :quantity, :price, :_destroy])
  end

  def calculate_total_price
    items_total = @order.order_items.sum(&:total_price)
    shipping_cost = @order.shipping_method&.price || 0
    items_total + shipping_cost
  end
end
