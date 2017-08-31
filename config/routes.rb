Rails.application.routes.draw do

  root 'dashboard#index'
  
  resources :sessions, path: 'acesso'
  resources :stores,   path: 'lojas' do
    resources :store_contexts, as: :contexts
    resources :store_staffs,   as: :staffs
    resources :store_managers, as: :managers
  end
end
