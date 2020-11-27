Rails.application.routes.draw do
  root to: "profiles#new"
  devise_for :users
  resources :profiles, only: [:index, :new, :edit]
end
