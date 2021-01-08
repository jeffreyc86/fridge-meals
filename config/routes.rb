Rails.application.routes.draw do

  get '/logout', to: 'sessions#destroy', as: 'logout'
  get '/home', to: 'sessions#home', as: 'home'
  resources :user_ingredients
  get 'ingredients/category_results', to: 'ingredients#cat_results', as: 'cat_results'
  get 'ingredients/results', to: 'ingredients#results', as: 'ing_results'
  resources :ingredients
  get 'recipes/results', to: 'recipes#results', as: 'results'
  resources :recipes
  resources :users, except: :index

  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  

  post '/favorites', to: 'favorites#create', as: "favorites"
  delete '/favorites/:id', to: 'favorites#destroy', as: "favorite"

 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
