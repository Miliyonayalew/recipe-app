class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
  end

  def create
    @recipe_food = RecipeFood.new(recipe_food_params)
    @recipe_food.recipe_id = Recipe.find(params[:recipe_id]).id
    if @recipe_food.save
      redirect_to recipe_path(params[:recipe_id]), notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_foods = RecipeFood.where(recipe_id: @recipe_food.recipe_id).where(food_id: @recipe_food.food_id)
    @recipe_foods.each(&:destroy)
    redirect_to request.referrer
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
