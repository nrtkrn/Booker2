Rails.application.routes.draw do
  get 'homes/top'
  get 'homes/about'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  resources :users, only: [:show, :edit, :update]
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
  root "books#index"

  get "/" => "books#index"
  get "books/:id" => "books#show"

  get "users/:id" => "users#show"
  get "users" => "users#index"

  get "home" => "homes#top"
  get "home/about" => "homes#about"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
