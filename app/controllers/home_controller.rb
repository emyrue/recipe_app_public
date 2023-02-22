class HomeController < ApplicationController
  # placeholder logic to prevent an endless user session.
  # Comment out before_action :signout if you want to stay logged in

  def index
    @recipes = Recipe.all
  end
end
