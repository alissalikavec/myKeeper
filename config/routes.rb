Rails.application.routes.draw do
  devise_for :users
  get 'bookmarks/topic/:tag', to: 'bookmarks#index', as: :tag
  resources :favorites, only: [:index]
  resources :bookmarks do
  	resources :favorites, only: [:create, :destroy]
  end
  root 'bookmarks#index'
  post :incoming, to: 'incoming#create'
  resources :welcome
end
