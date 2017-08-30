Rails.application.routes.draw do

  root 'dashboard#index'
  
  resources :sessions, path: 'acesso'
  resources :stores,   path: 'lojas' do
    resources :store_contexts, as: :contexts
  end
end
