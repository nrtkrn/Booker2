Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]

  root "homes#top"
  
  get "books/:id" => "books#show"

  get "users/:id" => "users#show"
  get "users" => "users#index"

  get "home/about" => "homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
