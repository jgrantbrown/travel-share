Rails.application.routes.draw do

  root to: "application#home"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: 'sessions#destroy'


  get '/users/:user_id/trips/edit', to: 'trips#edit', as: 'edit_user_trips'

  resources :users, except: [:index] do
    resources :trips, except: [:show] do
      resources :reviews
    end
  end

  resources :cities, only: [:show, :index, :new, :create]
  resources :trips, except: [:show]
   resources :reviews

end
