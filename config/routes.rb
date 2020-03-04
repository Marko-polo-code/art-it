Rails.application.routes.draw do
  devise_for :users
  root to: 'collections#index'
  # get "/collections/search", to: "collections#search", as: :search
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :collections do
    resources :bookings, only: [:create, :new]
    resources :reviews, only: [:new, :create]
  end

  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/account", to: "pages#account", as: :account
  get 'about', to: 'pages#about', as: :about
  get 'contact', to: 'pages#contact', as: :contact

  resources "contacts", only: [:new, :create]
end
