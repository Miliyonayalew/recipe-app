class GeneralShoppingListController < ApplicationController
  before_action :set_recipe, only: [:index]

  def index
    @recipe_foods = @recipe.recipe_foods.includes(:food)

    @missing_ingredients = @recipe_foods.select { |recipe_food| recipe_food.quantity > recipe_food.food.quantity }
    @missing_ingredients = @missing_ingredients.map do |recipe_food|
      {
        name: recipe_food.food.name,
        unit: recipe_food.food.measurement_unit,
        quantity: recipe_food.quantity - recipe_food.food.quantity,
        price: recipe_food.food.price * (recipe_food.quantity - recipe_food.food.quantity)
      }
    end

    @total_price = @missing_ingredients.map { |missing_ingredient| missing_ingredient[:price] }.sum
  end

  private

  def set_recipe
    @recipe = current_user.recipes.find(params[:recipe_id])
  end
end
