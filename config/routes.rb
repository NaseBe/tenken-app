Rails.application.routes.draw do
  devise_for :users
  root to: "tenkens#index"
  resources :users, only: [:edit, :update]
  resources :tenkens, except: :new
end
