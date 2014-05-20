RedesignGaswarnanlagenCom::Application.routes.draw do
  resources :documents
  resources :news
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  resources :products do
    # Ausschreibungstexte werden durch die ast action im
    # Products Controller generiert
    get 'ast', on: :member
  end

  resources :product_imports
  resources :categories

  root 'static_pages#home'
  match '/signup', to: 'users#new',            via: 'get'
  match '/signin', to: 'sessions#new',        via: 'get'
  match '/signout', to: 'sessions#destroy',   via: 'delete'
  match '/distributors',  to: 'static_pages#distributors',   via: 'get'
  match '/references',  to: 'static_pages#references',   via: 'get'
  match '/about',  to: 'static_pages#about',   via: 'get'
  match '/contact',to: 'static_pages#contact', via: 'get'
  match '/imprint',to: 'static_pages#imprint', via: 'get'
  
  # The priority is based upon order of creation: first created -> highest priority.
end
