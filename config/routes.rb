Rails.application.routes.draw do

  root 'home#index'

  get '/help',    to: 'home#help'
  get '/about',   to: 'home#about'
  get '/contact', to: 'home#contact'

  resources :users

  get    '/signup',  to: 'users#new'
  post   '/signup',  to: 'users#create'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
