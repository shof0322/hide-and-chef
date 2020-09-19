Rails.application.routes.draw do
  get 'users/show'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  root to: "chefs#index"

  resources :users, only: [:show, :update]

  resources :chefs, only:[:index, :new, :create, :show, :destroy] do
    resources :courses, only:[:new, :create, :edit, :destroy, :update]
  end
end
