class SubscribersController < ApplicationController
  def create
    @subscriber = Subscriber.new subscriber_params
    if @subscriber.save
      redirect_to root_path, notice: "Thanks for subscribing!"
    else
      redirect_to root_path, alert: "Failed to save"
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email)
  end
end
