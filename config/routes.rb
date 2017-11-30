Rails.application.routes.draw do

  root 'stores#index'

  resources :sessions, path: 'acesso'
  resources :stores,   path: 'lojas' do
    resources :store_staffs,   as: :staffs
    resources :store_managers, as: :managers

    resources :store_contexts, as: :contexts do

      resources :manager_evaluation_categories, as: :evaluation_categories do
        resources :manager_evaluation_criterions, as: :evaluation_criterions
        resources :manager_criterions, as: :criterions
        resources :manager_evaluations, as: :evaluations
      end

      resources :store_context_objectives, as: :objectives do
        resources :store_context_hit_objectives, as: :hit_objectives
      end

      resources :store_goals,    as: :goals do
        resources :store_staff_scores, as: :staff_scores
      end

      resources :store_indirect_team_awards, as: :indirect_awards
    end

  end
end
