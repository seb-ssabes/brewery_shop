class PaymentsController < ApplicationController
  layout 'checkout'
  before_action :set_order, only: [:new, :success_payment]
  def new
    @order = Order.find(session[:order_id])
    Rails.logger.info "Order: #{@order.inspect}"

    if @order.present?
      @order_items = @order.order_items
      Rails.logger.info "Order Items: #{@order_items.inspect}"
    else
      flash[:alert] = "Order not found."
      redirect_to root_path
    end

    set_ckeckout_session

    if @checkout_session.nil?
      flash[:alert] = "Failed to create checkout session."
    end
  rescue Pay::Error => e
    flash[:alert] = e.message
    redirect_to root_url
  end

  def success_payment
    if current_user
      current_cart = current_user.carts.find_by(active: true)
    else
      current_cart = Cart.find_by(id: session[:cart_id], active: true)
    end

    if current_cart
      current_cart.cart_items.destroy_all
      current_cart.update(active: false)
      session[:cart_id] = nil
    end
  end

  private

  def set_order
    @order = Order.find(session[:order_id])
    if @order.nil?
      flash[:alert] = "Order not found."
      redirect_to root_url and return
    end
  end

  def set_ckeckout_session
    if current_user
      payment_processor = current_user.set_payment_processor(:stripe)
      @checkout_session = payment_processor.checkout(**stripe_session_args(true))
    else
      @checkout_session = Stripe::Checkout::Session.create(stripe_session_args(false))
    end

    if @checkout_session.nil?
      flash[:alert] = "Checkout session creation failed."
      redirect_to root_url and return
    end

    Rails.logger.debug { "Checkout Session: #{@checkout_session.inspect}" }
  rescue => e
    Rails.logger.error "Error in creating checkout session: #{e.message}"
    flash[:alert] = "There was a problem processing your payment."
    redirect_to root_url
  end

  def get_shipping_cost(shipping_method_id)
    ShippingMethod.find(shipping_method_id).price
  end

  def stripe_session_args(include_customer_update)
    line_items = @order.order_items.map do |item|
      {
        price: item.beer.stripe_price_id,
        quantity: item.quantity
      }
    end

    line_items << {
      price_data: {
        currency: 'eur',
        product_data: {
          name: "#{@order.shipping_method.name}",
        },
        unit_amount: (@order.shipping_method.price * 100).to_i,
      },
      quantity: 1,
    }

    args = {
      mode: :payment,
      ui_mode: :embedded,
      line_items: line_items,
      metadata: {order_id: @order.id},
      success_url: success_payment_payments_url,
    }

    args[:customer_update] = {address: :auto} if include_customer_update

    args
  end
end
