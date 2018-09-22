Rails.application.routes.draw do
  resources :recipes
  devise_for :users
  root to: "recipes#index"
end
