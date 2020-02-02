Rails.application.routes.draw do
  # devise_for :users, controllers: {sessions: "sessions"}

  get '/logged_in', to: 'sessions#is_logged_in?'

  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      resources :users, only: [:create, :show, :index, :update]
      resources :events, only: [:create, :show, :index, :update]
      # get 'logged_in', to: 'users#logged_in?'
    end
  end
end
