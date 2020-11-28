Rails.application.routes.draw do
  get 'explores/index'
  root to: "profiles#new"
  devise_for :users
  resources :profiles, only: [:index, :new, :create, :edit]
end
