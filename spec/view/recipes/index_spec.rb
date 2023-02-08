require 'rails_helper'
require_relative 'actions_helper'

RSpec.describe Recipe, type: :system do
  include ActionsHelper
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
end
