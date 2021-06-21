class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: 'first')
    @recipe.ingredients.build(name: 'second')
  end

  def create
    @recipe = Recipe.create(recipe_params)
    if @recipe.save
      render @recipe
    else
      redirect_to new_recipe_path
    end
  end

  private
  def recipe_params
    params.require(:recipe).permit(
      :title,
      ingredients_attributes: [
      :name,
      :quantity
      ]
    )
  end

end
