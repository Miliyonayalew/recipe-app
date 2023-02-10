class RecipeFoodsController < ApplicationController
  def new
    @recipe_food = RecipeFood.new
    @current_user = current_user
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

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @recipe = Recipe.find(params[:recipe_id])
  end

  def update
    @recipe_food = RecipeFood.find(params[:id])
    if @recipe_food.update(recipe_food_params)
      redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Food was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :food_id)
  end
end
