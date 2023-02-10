class PublicRecipesController < ApplicationController
  def index
    @recipes = Recipe.includes(:user, :recipe_foods, recipe_foods: [:food]).where(public: true)
  end
end
