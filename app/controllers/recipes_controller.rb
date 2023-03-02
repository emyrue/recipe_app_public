class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.create(recipe_params)

    @recipe.user_id = current_user.id
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
    @image_data = @recipe.image_data
    if @recipe.update(recipe_params)
      Cloudinary::Api.delete_resources(@image_data)
      redirect_to '/'
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to edit_recipe_path(@recipe.id)
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @image_data = @recipe.image_data
    if @recipe.destroy
      Cloudinary::Api.delete_resources(@image_data)
      redirect_to '/'
    else
      flash[:error] = @recipe.errors.full_messages
      redirect_to '/'
    end
  end

  def new
    @recipe = Recipe.new
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :ingredients, :directions, :description, :image)
  end
end
