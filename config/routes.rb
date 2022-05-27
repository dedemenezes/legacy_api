Rails.application.routes.draw do

  namespace :api, default: :json do
    namespace :v1 do
      resources :books, only: :index
    end
  end
end
