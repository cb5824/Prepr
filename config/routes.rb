Rails.application.routes.draw do
  resources :items
  resources :recipes
  resources :lists do
    resources :items
    resources :recipes
  end

  root to: "homes#index"
end
