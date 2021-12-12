# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'slack/messages#index'
  namespace :api do
    namespace :v1 do
      post '/signup', to: 'registrations#signup'

      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      post '/logged_in', to: 'sessions#logged_in?'
      namespace :slack do
        resources :messages, except: %i[create]
      end
    end
  end
end
