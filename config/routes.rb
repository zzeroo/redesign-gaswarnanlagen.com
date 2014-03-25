RedesignGaswarnanlagenCom::Application.routes.draw do
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :products do
    collection { post :import }
  end
  resources :product_groups
  root 'static_pages#home'
  match '/signup', to: 'users#new',            via: 'get'
  match '/signin', to: 'sessions#new',        via: 'get'
  match '/signout', to: 'sessions#destroy',   via: 'delete'
  match '/help',   to: 'static_pages#help',    via: 'get'
  match '/about',  to: 'static_pages#about',   via: 'get'
  match '/contact',to: 'static_pages#contact', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
end
