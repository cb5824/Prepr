Rails.application.routes.draw do
  devise_for :users
  resources :items
  resources :recipes
  resources :stores
  resources :lists do
    resources :items
    resources :recipes
  end
  namespace :api do
    namespace :v1 do
      resources :recipes
      resources :lists
    end
  end
  root to: "homes#index"
end
