require 'rails_helper'
require_relative 'actions_helper_recipe'

RSpec.describe Recipe, type: :system do
  include ActionsHelperRecipe
  it 'I can see the recipe name' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    expect(page).to have_content('Recipe Name')
  end

  it 'I can see the Add ingredient button' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    expect(page).to have_content('Add ingredient')
  end

  it 'When I click on Add ingredient, it redirects me to recipe foods new page' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    click_link 'Add ingredient'
    expect(page).to have_current_path(new_recipe_recipe_food_path(recipe_id: Recipe.first))
  end

  it 'When I click on Generate Shopping List, it redirects me to general shopping list index page' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    click_link 'Generate Shopping List'
    expect(page).to have_current_path(general_shopping_list_index_path)
  end
end
