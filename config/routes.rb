Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'

  resources :foods, only: [:index, :show, :new, :create, :destroy]
  
end
