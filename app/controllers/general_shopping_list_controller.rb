class GeneralShoppingListController < ApplicationController
  def index
    @foods = Food.includes(:recipe_foods).where(user_id: current_user.id)
    @missing_ingredients = []
    @foods.each do |food|
      total_quantity = 0
      food.recipe_foods.each do |recipe_food|
        total_quantity += recipe_food.quantity
      end
      @missing_ingredients << food if total_quantity > food.quantity
    end
    @missing_ingredients = @missing_ingredients.map do |food|
      {
        name: food.name,
        unit: food.measurement_unit,
        quantity: food.recipe_foods.sum(:quantity) - food.quantity,
        price: food.price * (food.recipe_foods.sum(:quantity) - food.quantity)
      }
    end
    @total_price = @missing_ingredients.map { |missing_ingredient| missing_ingredient[:price] }.sum
  end
end
