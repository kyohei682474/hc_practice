# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'items', to: 'items#index'
  get 'items/new', to: 'items#new'
  # Defines the root path route ("/")
  # root "articles#index"
end
