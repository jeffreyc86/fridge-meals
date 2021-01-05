Rails.application.routes.draw do

  resources :users, except: :index

  get '/login', to: 'users#login', as: 'login'
  post '/login', to: 'users#handle_login'
  delete '/logout', to: 'sessions#logout', as: 'logout'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
