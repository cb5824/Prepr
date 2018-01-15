Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :items
  resources :recipes
  resources :stores
  resources :users
  resources :lists do
    resources :items
    resources :recipes
  end
  namespace :api do
    namespace :v1 do
      resources :recipes
      resources :lists
      resources :stores
      resources :users
    end
  end
  root to: "homes#index"
end
