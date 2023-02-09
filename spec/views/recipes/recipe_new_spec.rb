require 'rails_helper'
require_relative 'actions_helper_recipe'

RSpec.describe Food, type: :system do
  include ActionsHelperRecipe
  it 'I can see the title' do
    sign_up
    visit new_recipe_path
    expect(page).to have_content('New Recipe')
  end

  it 'I can add some information' do
    sign_up
    visit new_recipe_path
    fill_in 'recipe_name', with: 'Recipe Name', id: 'recipe_name'
    fill_in 'recipe_preparation_time', with: '20', id: 'recipe_preparation_time'
    fill_in 'recipe_cooking_time', with: '10', id: 'recipe_cooking_time'
    fill_in 'recipe_description', with: 'This is a description', id: 'recipe_description'
    click_button 'Create Recipe'
    expect(page).to have_content('Recipe was successfully created')
  end
end
