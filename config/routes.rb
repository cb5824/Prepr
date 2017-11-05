Rails.application.routes.draw do
  resources :items
  resources :recipes

  root to: "homes#index"
end
