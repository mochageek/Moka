Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :users, only: [:show] # ユーザーマイページへのルーティング
 
  get 'coffees/tagall' => 'coffees#tagall'
  get 'coffees/top' => 'coffees#top'
  get 'coffees/ranking' => 'coffees#ranking'

  resources :coffees do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]   
  end

  resources :images
  resources :users  

  root 'coffees#index'
end
