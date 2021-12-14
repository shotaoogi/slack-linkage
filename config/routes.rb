# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'registrations#signup'

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      post '/logged_in', to: 'sessions#logged_in?'
      namespace :slack do
        resources :messages, only: %i[] do
          collection do
            post 'receive'
          end
        end
      end
    end
  end
end
