Rails.application.routes.draw do
  get 'bookmarks/topic/:tag', to: 'bookmarks#index', as: :tag
  resources :bookmarks
  root 'welcome#index'
end
