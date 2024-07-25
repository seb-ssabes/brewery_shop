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
    :status, :name, :email, :shipping_method_id, :total_price, :"user_id", :"last_name",
    :"address", :"phone", :"country", :"city", :"post_code", :"region",
    order_items_attributes: [:id, :beer_id, :quantity, :price, :_destroy])
  end

  def calculate_total_price
    items_total = @order.order_items.sum(&:total_price)
    shipping_cost = @order.shipping_method&.price || 0
    items_total + shipping_cost
  end
end
