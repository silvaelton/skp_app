Rails.application.routes.draw do

  root 'dashboard#index'
  
  resources :sessions, path: 'acesso'

  resources :stores,   path: 'lojas'
end
