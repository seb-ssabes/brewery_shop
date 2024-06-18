class ApplicationController < ActionController::Base
  before_action :initialize_subscriber

  private

  def initialize_subscriber
    @subscriber = Subscriber.new
  end
end
