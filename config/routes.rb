Rails.application.routes.draw do
  root to: "profiles#index"
  devise_for :users
  resources :profiles, only: [:index, :new, :create, :edit]
end
