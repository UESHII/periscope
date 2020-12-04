Rails.application.routes.draw do
  root to: "profiles#index"
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  resources :profiles, only: [:index, :new, :create, :edit, :show, :update, :destroy]
  resources :explores, only: [:index]
  resources :evaluations do
    resources :reviews, only: [:new, :create]
  end
end
