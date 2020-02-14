Rails.application.routes.draw do
  namespace :api, :defaults => {:format => :json} do
    namespace :v1 do
      post '/login', to: 'sessions#create'
      delete '/logout', to: 'sessions#destroy'
      get '/logged_in', to: 'sessions#is_logged_in?'
      resources :users, only: [:create, :show, :index, :update]
      resources :events, only: [:create, :show, :index, :update]
      resources :event_occurrences, only: [:index, :show]
      resources :event_tags, only: [:create, :index]
    end
  end
end
