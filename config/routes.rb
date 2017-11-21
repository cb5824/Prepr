Rails.application.routes.draw do
  resources :items
  resources :recipes
  resources :lists do
    resources :items
    resources :recipes
  end
  namespace :api do
    namespace :v1 do
      resources :recipes
    end
  end
  root to: "homes#index"
end
