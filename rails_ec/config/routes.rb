# frozen_string_literal: true

Rails.application.routes.draw do
  
  get 'items/show'
  resources :tasks
  # Defines the root path route ("/")
  # root "articles#index"
  root "items#index"
end