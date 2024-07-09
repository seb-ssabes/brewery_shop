class OrdersController < ApplicationController
  layout 'checkout', only:[:new]

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

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:status, order_items_attributes: [:beer_id, :quantity, :price])
  end

  def calculate_total_price
    @order.order_items.map { |items| item.quantity * item.price }.sum
  end
end
