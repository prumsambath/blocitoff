Rails.application.routes.draw do
  devise_for :users

  resources :lists do
    resources :items, only: [:create, :update, :destroy]
  end

  delete '/lists/:list_id/clear_complete_items' => 'items#clear_complete_items', as: 'clear_complete_items'

  root to: 'welcome#index'
end
