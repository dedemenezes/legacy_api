# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api, default: :json do
    namespace :v1 do
      resources :books, only: %i[index show]
      resources :characters, only: %i[index show]
      resources :wands, only: %i[index show]
    end
  end
end
