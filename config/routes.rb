Rails.application.routes.draw do
  resources :products
  resources :categories
  resources :brands

  post "/login", to: "sessions#login"
  post "/signup", to: "sessions#signup"
end
