Rails.application.routes.draw do
  devise_for :users
  root to: "tenkens#index"
  resources :users, only: [:edit, :update]
  resources :tenkens, only: [:index, :create, :show, :edit, :update]
end
