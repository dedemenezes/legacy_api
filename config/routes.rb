# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :books, only: %i[index show]
      resources :characters, only: %i[index show]
      resources :wands, only: %i[index show]
      resources :creature_types, only: %i[index show]
      resources :houses, only: %i[index show]
    end
  end

  get 'timer', to: 'timers#show', as: :timer
end
