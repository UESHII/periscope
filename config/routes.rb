Rails.application.routes.draw do
  root to: "profiles#index"
  get 'explores/search', to: 'explores#search'
  devise_for :users, :controllers => { :registrations => 'users/registrations' }
  resources :profiles, only: [:index, :new, :create, :edit, :show, :update, :destroy]
  resources :explores, only: [:index]
  resources :evaluations do
    resources :reviews, only: [:create]
  end
end
