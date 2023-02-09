require 'rails_helper'
require_relative 'actions_helper_recipe'

RSpec.describe Food, type: :system do
  include ActionsHelperRecipe
  it 'I can see the title' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    click_link 'Add ingredient'
    expect(page).to have_content('New Ingredient')
  end

  it 'I can see the Add ingredient button' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    click_link 'Add ingredient'
    expect(page).to have_content('Add ingredient')
  end

  it 'I can see the error when a value is different than a number' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    click_link 'Add ingredient'
    fill_in 'recipe_food_quantity', with: '15', id: 'recipe_food_quantity'
    click_button 'Add ingredient'
    expect(page).to have_content('Food must exist')
  end
end
