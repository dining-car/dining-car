# frozen_string_literal: true

Rails.application.routes.draw do
  resources :instruction_groups
  resources :accounts
  resources :ingredients
  resources :units
  resources :ingredient_groups
  resources :cuisines
  resources :courses
  resources :recipes
  devise_for :users, path: 'auth', controllers: {
    registrations:      'auth/registrations',
  }
  root to: "recipes#index"
end
