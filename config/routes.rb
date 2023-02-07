Rails.application.routes.draw do
  devise_for :users
  root to: 'foods#index'

  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
end
