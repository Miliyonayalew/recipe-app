module ActionsHelper
  def sign_up
    visit new_user_registration_path
    fill_in 'user_name', with: 'David', id: 'user_name'
    fill_in 'user_email', with: 'david.tamayo1112@gmail.com', id: 'user_email'
    fill_in 'user_password', with: '123456', id: 'user_password'
    fill_in 'user_password_confirmation', with: '123456', id: 'user_password_confirmation'
    click_button 'Sign up'
  end
end
