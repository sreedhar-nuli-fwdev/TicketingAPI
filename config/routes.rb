Rails.application.routes.draw do
  resources :agents
  resources :comments
  resources :tickets
  resources :users, only: [:index, :create, :show]
  post 'users/email', to: 'users#email'
  post 'login', to: 'auth#login'
  get '/translations', to: 'translations#index'
  get '/search', to: 'search#search'
end
