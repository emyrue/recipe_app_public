class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(user_id: current_user.id, name: params[:recipe][:name], ingredients: params[:recipe][:ingredients], directions: params[:recipe][:directions], description: params[:recipe][:description])
    if @recipe.save
      redirect_to '/'
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

  def update
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to '/'
  end

  def new
    @recipe = Recipe.new
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :directions, :description)
  end
end
