Rails.application.routes.draw do
  devise_for :users
  root to: 'collections#index'
  # get "/collections/search", to: "collections#search", as: :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :collections do
    resources :bookings, only: [:create, :new]
    resources :favorites, only: [:create, :destroy]
  end
  resources :bookings, only: [] do
    resources :reviews, only: [:new, :create]
  end


  resources :bookings, only: [] do
      put :accept
      put :reject
  end

  post "favorites", to: "favorites#create", as: :new_favorite

  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/account", to: "pages#account", as: :account
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact
  get 'favorites', to: 'favorites#index', as: :my_favorites
  resources "contacts", only: [:new, :create]
end
