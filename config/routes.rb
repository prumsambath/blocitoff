Rails.application.routes.draw do
  devise_for :users

  resources :lists, only: [:index, :show, :create]

  root to: 'welcome#index'
end
