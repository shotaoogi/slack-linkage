# frozen_string_literal: true

Rails.application.routes.draw do
  root 'home#index'
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'registrations#signup'

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#logged_in'
      namespace :slack do
        resources :messages, only: %i[index] do
          collection do
            post 'receive'
            post 'slash_command'
          end
        end
      end
      resources :linkages, only: %i[index create]
    end
  end
end
