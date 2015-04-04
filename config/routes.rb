Rails.application.routes.draw do
  devise_for :users

  
  resources :beers, only: [:index, :show]
  resources :favorites, only: [:index, :create, :destroy]

  # authenticated :user do
  #   root 'favorites#index', as: "authenticated_root"
  # end

  root 'beers#index'

end
