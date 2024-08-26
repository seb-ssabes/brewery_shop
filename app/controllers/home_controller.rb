class HomeController < ApplicationController
  def index
    @subscriber = Subscriber.new
    @beers = Beer.all
  end
end
