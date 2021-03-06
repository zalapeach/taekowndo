Rails.application.routes.draw do
  root 'home#index'

  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'logout', to: 'sessions#destroy', as: 'logout'
  resources :students, only: :show

  resources :sessions, only: [:create, :destroy]

  namespace :admin do
    root 'home#index'
    resources :students
    resources :grades, only: :index
    resources :states, only: :index
    resources :users, except: [:show, :update, :edit]
  end
end
