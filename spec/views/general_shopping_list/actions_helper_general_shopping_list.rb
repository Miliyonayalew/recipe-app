module ActionsHelperGeneralShoppingList
  def sign_up
    visit new_user_registration_path
    fill_in 'user_name', with: 'David', id: 'user_name'
    fill_in 'user_email', with: 'david.tamayo1112@gmail.com', id: 'user_email'
    fill_in 'user_password', with: '123456', id: 'user_password'
    fill_in 'user_password_confirmation', with: '123456', id: 'user_password_confirmation'
    click_button 'Sign up'
    visit recipes_path
  end

  def add_food
    visit new_food_path
    fill_in 'food_name', with: 'Meat', id: 'food_name'
    fill_in 'food_measurement_unit', with: 'kg', id: 'food_measurement_unit'
    fill_in 'food_price', with: '10', id: 'food_price'
    fill_in 'food_quantity', with: '10', id: 'food_quantity'
    click_button 'Create Food'
  end

  def add_recipe
    visit new_recipe_path
    fill_in 'recipe_name', with: 'Recipe Name', id: 'recipe_name'
    fill_in 'recipe_preparation_time', with: '20', id: 'recipe_preparation_time'
    fill_in 'recipe_cooking_time', with: '10', id: 'recipe_cooking_time'
    fill_in 'recipe_description', with: 'This is a description', id: 'recipe_description'
    check('recipe_public')
    click_button 'Create Recipe'
    click_link 'Recipe Name'
  end

  def add_ingredient
    click_link 'Add ingredient'
    fill_in 'recipe_food_quantity', with: '11', id: 'recipe_food_quantity'
    select('Meat', from: 'recipe_food_food_id')
    click_button 'Add ingredient'
  end
end
