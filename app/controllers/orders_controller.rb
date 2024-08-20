class OrdersController < ApplicationController
  layout 'checkout', only:[:new]
  before_action :set_order, only: [:show]

  def new
    @order = Order.new
    @shipping_methods = ShippingMethod.all
    Rails.logger.debug("Current Cart: #{current_cart.inspect}")
    Rails.logger.debug("Cart Items: #{current_cart.cart_items.inspect}")


    @order_items = current_cart.cart_items.map do |item|
      @order.order_items.build(beer: item.beer, quantity: item.quantity, price: item.beer.price)
    end

    Rails.logger.debug("Order: #{@order.inspect}")
    Rails.logger.debug("Order items: #{@order.order_items.inspect}")
    Rails.logger.debug("Items subtotal: #{calculate_total_price}")
  end


  def create
    @order = current_user.orders.new(order_params)
    @order.status = "pending"
    @order.shipping_method = ShippingMethod.find(params[:order][:shipping_method_id])
    @order.total_price = calculate_total_price

    if @order.save
      session[:order_id] = @order.id
      session[:cart_id] = nil
      redirect_to new_payment_path
    else
      @shipping_methods = ShippingMethod.all
      @order_items = current_cart.cart_items.map do |item|
        @order.order_items.build(beer: item.beer, quantity: item.quantity, price: item.beer.price)
      end
      render :new
    end
  end

  def update_total_price
    @order = Order.find(params[:order_id])
    @order.update(shipping_method_id: params[:shipping_method_id])

    render json: { total_price: @order.total_price }
  end

  def show
    @order = Order.find(params[:id])
    @order_items = current_cart.cart_items.map do |item|
      @order.order_items.build(beer: item.beer, quantity: item.quantity, price: item.beer.price)
    end
  end

  private

  def set_order
    @order = Order.find(params[:order_id])
  end

  def order_params
    params.require(:order).permit(
    :name, :"last_name", :email, :"address", :"user_id",
    :"phone", :"country", :"city", :"post_code", :"region", :shipping_method_id,
    order_items_attributes: [:id, :beer_id, :quantity, :price, :_destroy])
  end

  def calculate_total_price
    @order.items_subtotal
  end
end
