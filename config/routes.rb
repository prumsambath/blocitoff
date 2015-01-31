Rails.application.routes.draw do
  devise_for :users

  resources :lists, only: [:index, :show, :create, :update]

  root to: 'welcome#index'
end
