class HomeController < ApplicationController
  def index
    @beers = Beer.all
  end
end
