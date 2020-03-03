Rails.application.routes.draw do
  devise_for :users
  root to: 'collections#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :collections do
    resources :bookings, only: [:create, :new]
    resources :reviews, only: [:new, :create]
  end

  get "/dashboard", to: "pages#dashboard", as: :dashboard
  get "/account", to: "pages#account", as: :account
end
