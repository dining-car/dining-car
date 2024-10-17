# frozen_string_literal: true

Rails.application.routes.draw do
  resources :recipes, only: [:index]
  resources :units
  resources :cuisines
  resources :courses
  devise_for :users, path: "auth", controllers: {
    registrations: "auth/registrations"
  }

  get "/accounts/:username", to: redirect("/@%{username}"), constraints: ->(req) { req.format.nil? || req.format.html? } # rubocop:disable Style/FormatStringToken

  resources :accounts, only: :show, param: :username do
    resources :recipes, except: [:index]
  end

  resources :instruction_groups, only: %i[create destroy]
  resources :ingredient_groups, only: %i[create destroy]
  resources :ingredients, only: %i[create destroy]

  get "/@:username", to: "accounts#show", as: :short_account
  get "/@:account_username/:id", to: "recipes#show", as: :short_account_recipe

  root to: "recipes#index"
end
