Rails.application.routes.draw do

  root 'stores#index'
  
  resources :sessions, path: 'acesso'
  resources :stores,   path: 'lojas' do
    resources :store_staffs,   as: :staffs
    resources :store_managers, as: :managers

    resources :store_contexts, as: :contexts do   
      
      resources :store_context_objectives, as: :objectives do 
        resources :store_context_hit_objectives, as: :hit_objectives
      end

      resources :store_goals,    as: :goals do 
        resources :store_staff_scores, as: :staff_scores
      end
    end

  end
end
