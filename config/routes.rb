Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] # ユーザーマイページへのルーティング
  
  resources :coffees do
    resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create]
  end
  
  resources :users

  root 'coffees#index'
end
