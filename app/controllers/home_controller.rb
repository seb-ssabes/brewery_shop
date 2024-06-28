class HomeController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]

  def index
    @subscriber = Subscriber.new
    @beers = Beer.all
  end
end
