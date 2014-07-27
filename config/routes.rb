Rails.application.routes.draw do
  devise_for :users
  get 'bookmarks/topic/:tag', to: 'bookmarks#index', as: :tag
  resources :bookmarks
  root 'bookmarks#index'
end
