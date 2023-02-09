require 'rails_helper'
require_relative 'actions_helper_public_recipe'

RSpec.describe Food, type: :system do
  include ActionsHelperPublicRecipe
  it 'I can see the title' do
    sign_up
    add_recipe
    expect(page).to have_content('Recipe Name')
  end

  it 'When I click on Recipe Name, it redirects me to recipe show page' do
    sign_up
    add_recipe
    click_link 'Recipe Name'
    expect(page).to have_current_path(recipe_path(id: Recipe.first))
  end
end
