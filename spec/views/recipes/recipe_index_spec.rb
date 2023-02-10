require 'rails_helper'
require_relative 'actions_helper_recipe'

RSpec.describe Recipe, type: :system do
  include ActionsHelperRecipe
  it 'I can see the button New Recipe' do
    sign_up
    expect(page).to have_content('New Recipe')
  end

  it 'I can see There are no recipes yet when it is empty' do
    sign_up
    expect(page).to have_content('There are no recipes yet')
  end

  it 'When I click on New Recipe, it redirects me to recipe new page' do
    sign_up
    click_link 'New Recipe'
    expect(page).to have_current_path(new_recipe_path)
  end

  it 'I can see foods when I add a food' do
    sign_up
    add_recipe
    expect(page).to have_content('This is a description')
  end

  it 'I cannot see foods when I delete a food' do
    sign_up
    add_recipe
    click_link 'REMOVE'
    accept_alert
    expect(page).to have_content('There are no recipes yet')
  end
end
