Rails.application.routes.draw do

  resources :user_ingredients
  resources :ingredients
  resources :recipes
  resources :users, except: :index

  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  post '/favorites', to: 'favorites#create', as: "favorites"
  delete '/favorites/:id', to: 'favorites#destroy', as: "favorite"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
