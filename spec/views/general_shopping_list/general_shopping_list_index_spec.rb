require 'rails_helper'
require_relative 'actions_helper_general_shopping_list'

RSpec.describe Food, type: :system do
  include ActionsHelperGeneralShoppingList
  it 'I can see the title' do
    sign_up
    visit general_shopping_list_index_path
    expect(page).to have_content('Shopping List')
  end

  it 'I can see the messages when it is empty' do
    sign_up
    visit general_shopping_list_index_path
    expect(page).to have_content('There are no missing ingredients that must be purchased')
  end

  it 'I can see the total and the name of the food when it is not empty' do
    sign_up
    add_food
    add_recipe
    add_ingredient
    visit general_shopping_list_index_path
    expect(page).to have_content('Total value of foods neded: 10 $')
  end

  it 'I can see the name of the food when it is not empty' do
    sign_up
    add_food
    add_recipe
    add_ingredient
    visit general_shopping_list_index_path
    expect(page).to have_content('Meat')
  end
end
