class RecipeController < ApplicationController
  def show; end

  def create; end

  def update; end

  def destroy; end

  private

  def contact_params
    params.require(:recipe).permit(:name, :ingredients, :directions, :description)
  end
end
