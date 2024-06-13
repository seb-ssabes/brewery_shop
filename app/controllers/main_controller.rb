class MainController < ApplicationController
  def index
    @subscriber = Subscriber.new
  end
end
