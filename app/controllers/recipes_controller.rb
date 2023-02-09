class RecipesController < ApplicationController
  load_and_authorize_resource

  def index
    @recipes = Recipe.includes(:user).where(user_id: current_user.id)
  end

  def show
    @foods = Food.all
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'Food was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if @recipe.destroy
      redirect_to recipes_path
    else
      render 'new'
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
