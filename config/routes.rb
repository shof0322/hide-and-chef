Rails.application.routes.draw do
  get 'orders/new'
  get 'orders/create'
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  
  root to: "chefs#index"

  resources :users, only: [:show, :update, :new]

  resources :chefs, only:[:index, :new, :create, :show, :destroy] do
    resources :courses, only:[:new, :create, :edit, :destroy, :update]
  end

  resources :cards, only: [:new, :create]

  resources :orders, only: [:new, :create]
end
