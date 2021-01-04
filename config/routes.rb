Rails.application.routes.draw do

  resources :users, except: :index

  get '/login', to: 'users#login_page', as: 'login'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
