class ApplicationController < ActionController::Base
  before_action :initialize_subscriber
  before_action :set_current_cart
  before_action :configure_permitted_parameters, if: :devise_controller?
  # before_action :authenticate_user!

  helper_method :current_cart

  # protect_from_forgery with: :exception


  def current_cart
    if current_user
      @current_cart ||= Cart.find_or_create_by(user: current_user, active: true)
    else
      if session[:cart_id]
        cart = Cart.find_by(id: session[:cart_id])
        if cart.present?
          @current_cart ||= cart
        else
          session[cart_id] = nil
        end
      end

      if session[:cart_id].nil?
        @current_cart = Cart.create(active: true)
        session[:cart_id] = @current_cart.id
      end
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

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :email, :password, :password_confirmation])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :last_name])
  end
end
