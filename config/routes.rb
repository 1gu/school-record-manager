Rails.application.routes.draw do

  root 'welcome#index'

  get 'home', to: 'home#index', as: 'home'

  devise_for :users

  get 'admin', to: 'admin/dashboards#index', as: 'dashboard'

  namespace :admin do
    resources :schools do
      resources :klasses
    end

    get 'users', to: 'users#index'
    post 'users/:id', to: 'users#update_role', as: 'update_user_role'

    scope 'classes/:klass_id' do
      resources :subjects
    end
  end

  get 'records', to: 'records#index', as: 'records'
end
