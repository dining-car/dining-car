# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

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
