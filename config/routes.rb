# frozen_string_literal: true

Rails.application.routes.draw do
  resources :cuisines
  resources :courses
  resources :recipes
  devise_for :users
  root to: "recipes#index"
end
