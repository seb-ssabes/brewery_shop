class ApplicationController < ActionController::Base
  before_action :initialize_subscriber
  before_action :set_current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_cart

  def current_cart
    if current_user
      @current_cart ||= Cart.find_or_create_by(user: current_user, active: true)

      unless @current_cart.active?
        @current_cart = Cart.create(user: current_user, active: true)
      end
    else
      @current_cart = find_cart_in_session || create_guest_cart
    end

    @current_cart
  end

  private

  def initialize_subscriber
    @subscriber = Subscriber.new
  end

  def set_current_cart
    @current_cart = current_cart
  end

  def find_cart_in_session
    return unless session[:cart_id]
    cart = Cart.find_by(id: session[:cart_id])

    if cart&.active?
      cart
    else
      session[:cart_id] = nil
      nil
    end
  end

  def create_guest_cart
    cart = Cart.create(active: true)
    session[:cart_id] = cart.id
    cart
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name])
  end
end
