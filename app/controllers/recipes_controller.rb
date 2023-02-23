class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(user_id: current_user.id, name: params[:recipe][:name],
                         ingredients: params[:recipe][:ingredients], directions: params[:recipe][:directions],
                         description: params[:recipe][:description], image: params[:recipe][:image])
    if @recipe.save
      redirect_to '/'
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to new_recipe_path
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to '/'
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to edit_recipe_path(@recipe.id)
    end
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
    params.require(:recipe).permit(:name, :ingredients, :directions, :description, :image)
  end
end
