class PaymentsController < ApplicationController
  before_action :set_order, only: [:new]
  def new
    @order = current_user.orders.last
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


  private

  def set_order
    @order = Order.find(session[:order_id])
    if @order.nil?
      flash[:alert] = "Order not found."
      redirect_to root_url and return
    end
  end

  def set_ckeckout_session
    payment_processor = current_user.set_payment_processor(:stripe)

    args = {
      customer_update: {address: :auto},
      mode: :payment,
      ui_mode: :embedded,
      line_items:[
        { price: "price_1Pg3FuDXtvoNv6XkUbpNlPTh", quantity: 1 },
        { price: "price_1Pg3FNDXtvoNv6Xk28ewlcZ0", quantity: 1 },
        { price: "price_1Pg3EsDXtvoNv6XkgNqABmsS", quantity: 1 },
        { price: "price_1Pg3E9DXtvoNv6XkDOVZyijm", quantity: 1 },
        { price: "price_1Pg3DTDXtvoNv6XkNpQIBLH6", quantity: 1 },
        { price: "price_1Pg3CcDXtvoNv6XklOoxyxxp", quantity: 1 },
        { price: "price_1Pg3BDDXtvoNv6XkDPx3OKsS", quantity: 1 },
        { price: "price_1Pg3AcDXtvoNv6XkQ6lyYcWC", quantity: 1 },
        { price: "price_1Pg39tDXtvoNv6Xk2dkpwrfm", quantity: 1 },
        { price: "price_1Pg36bDXtvoNv6Xk4adIZ6JM", quantity: 1 }
      ],
      metadata: {order_id: @order.id},
      return_url: fulfillments_url,
    }

    @checkout_session = payment_processor.checkout(**args)

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
end
