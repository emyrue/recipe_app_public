class HomeController < ApplicationController
  # placeholder logic to prevent an endless user session.
  # Comment out before_action :signout if you want to stay logged in

  RECIPES_PER_PAGE = 1

  def index
    @recipes_all = Recipe.all
    @params = params.permit(:page, :query)
    @current_page = params[:page].to_i
    if @current_page == 0
      @current_page = 1
    end
    @recipes = @recipes_all.where("lower(name) LIKE ?", "%#{params[:query].to_s.downcase}%").offset((@current_page-1) * RECIPES_PER_PAGE).limit(RECIPES_PER_PAGE)
    @total_pages = (@recipes_all.count / RECIPES_PER_PAGE.to_f).ceil
  end
end
