require 'rails_helper'
require_relative 'actions_helper_food'

RSpec.describe Food, type: :system do
  include ActionsHelperFood
  it 'I can see the foods title' do
    sign_up
    expect(page).to have_content('Foods')
  end

  it 'I can see No foods when it is empty' do
    sign_up
    expect(page).to have_content('No foods')
  end

  it 'When I click on Add food, it redirects me to food new page' do
    sign_up
    click_link 'Add food'
    expect(page).to have_current_path(new_food_path)
  end

  it 'I can see foods when I add a food' do
    sign_up
    add_food
    visit foods_path
    expect(page).to have_content('Meat')
  end

  it 'I cannot see foods when I delete a food' do
    sign_up
    add_food
    visit foods_path
    click_link 'Delete'
    accept_alert
    expect(page).to have_content('No foods')
  end
end
