Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "application#home"
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout' => 'sessions#destroy'
  get '/edit', to: "users#edit"
  patch '/users/:id', to: "users#update"
  get 'users/:id', to: "users#show"
  resources :users
  resources :sessions, only: [:create]
  resources :trips
  resources :cities, only: [:show, :index] do
    resources :reviews, only: [:new, :create, :show]
  end
  #resources :sessions
end
