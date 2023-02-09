require 'rails_helper'
require_relative 'actions_helper'

RSpec.describe Food, type: :system do
  include ActionsHelper
  it 'I can see the food name' do
    sign_up
    add_food
    expect(page).to have_content('Food Name: Meat')
  end

  it 'I can see the quantity' do
    sign_up
    add_food
    expect(page).to have_content('Quantity: 10')
  end
end
