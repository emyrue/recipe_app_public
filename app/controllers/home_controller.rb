class HomeController < ApplicationController
  # placeholder logic to prevent an endless user session.
  # Comment out before_action :signout if you want to stay logged in

  before_action :signout

  def index
    @recipes = Recipe.all
  end

  def signout
    sign_out current_user if current_user
  end
end
