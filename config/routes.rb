Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pages, only: [:edit, :update]
  resources :pets do 
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :destroy, :update]
  resources :dashboards, only: [:index]
end