RedesignGaswarnanlagenCom::Application.routes.draw do
  get "news/new"
  get "news/index"
  resources :news
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :products 
  resources :product_imports
  resources :product_groups
  root 'static_pages#home'
  match '/signup', to: 'users#new',            via: 'get'
  match '/signin', to: 'sessions#new',        via: 'get'
  match '/signout', to: 'sessions#destroy',   via: 'delete'
  match '/distributors',  to: 'static_pages#distributors',   via: 'get'
  match '/references',  to: 'static_pages#references',   via: 'get'
  match '/about',  to: 'static_pages#about',   via: 'get'
  match '/contact',to: 'static_pages#contact', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
end
