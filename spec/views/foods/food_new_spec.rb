require 'rails_helper'
require_relative 'actions_helper_food'

RSpec.describe Food, type: :system do
  include ActionsHelperFood
  it 'I can see the title' do
    sign_up
    visit new_food_path
    expect(page).to have_content('New food')
  end

  it 'I can add some information' do
    sign_up
    visit new_food_path
    fill_in 'food_name', with: 'Meat', id: 'food_name'
    fill_in 'food_measurement_unit', with: 'kg', id: 'food_measurement_unit'
    fill_in 'food_price', with: '10', id: 'food_price'
    fill_in 'food_quantity', with: '10', id: 'food_quantity'
    click_button 'Create Food'
    expect(page).to have_content('Food was successfully created')
  end

  it 'I can see the error when a value is different than a number' do
    sign_up
    visit new_food_path
    fill_in 'food_name', with: 'Meat', id: 'food_name'
    fill_in 'food_measurement_unit', with: 'kg', id: 'food_measurement_unit'
    fill_in 'food_price', with: 'k', id: 'food_price'
    fill_in 'food_quantity', with: '10', id: 'food_quantity'
    click_button 'Create Food'
    expect(page).to have_content('Price is not a number')
  end
end
