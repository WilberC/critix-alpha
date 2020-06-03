Rails.application.routes.draw do
  # get 'users/new'
  # get 'users/create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games, only: [:index, :show, :new, :create, :edit, :update]
  resources :companies, only: [:index, :show, :new, :create, :edit, :update]
  # Routes for users
  resources :users, only: [:new, :create]

  # Routes for sessions
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  delete 'session', to: 'sessions#destroy'
end
