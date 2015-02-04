Rails.application.routes.draw do
  devise_for :users

  resources :lists do
    resources :items, only: [:index, :create, :update, :delete]
  end

  root to: 'welcome#index'
end
