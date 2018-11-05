# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes, only: [:index]
  resources :units
  resources :cuisines
  resources :courses
  devise_for :users, path: "auth", controllers: {
    registrations:      "auth/registrations",
  }

  get "/accounts/:username", to: redirect("/@%{username}"), constraints: lambda { |req| req.format.nil? || req.format.html? }

  resources :accounts, only: :show, param: :username do
    resources :recipes, except: [:index]
  end

  get "/@:username", to: "accounts#show", as: :short_account
  get "/@:account_username/:id", to: "recipes#show", as: :short_account_recipe

  root to: "recipes#index"
end
