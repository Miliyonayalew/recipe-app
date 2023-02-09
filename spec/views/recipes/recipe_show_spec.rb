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
end
