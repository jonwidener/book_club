# frozen_string_literal: true

Rails.application.routes.draw do
  resources :books do
    resources :chapters
  end

  resources :comments, only: [:create]

  get 'data/index'
  get '/data', to: 'data#index', as: 'data'
  post '/import', to: 'data#import', as: 'import'
  get '/export', to: 'data#export', as: 'export', defaults: { format: 'csv' }

  root 'books#index'
end
