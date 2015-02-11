Rails.application.routes.draw do
  devise_for :users

  resources :lists do
    resources :items, only: [:create, :update, :destroy]
  end

  root to: 'welcome#index'
end
