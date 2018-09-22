# frozen_string_literal: true

Rails.application.routes.draw do
  resources :ingredients
  resources :units
  resources :ingredient_groups
  resources :cuisines
  resources :courses
  resources :recipes
  devise_for :users
  root to: "recipes#index"
end
