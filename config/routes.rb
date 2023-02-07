Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root to: 'users#index'

  resources :recipes, only: [:index, :show, :new, :create]
  # root "articles#index"
end
