Rails.application.routes.draw do
  mount Bootsy::Engine => '/bootsy', as: 'bootsy'
  root 'welcome#index'

  resources :users, only: :create

  resources :notes, except: :edit

  resources :sessions, only: :create
  get 'sign_up' => 'users#new', as: :sign_up
  delete 'logout' => 'sessions#destroy', as: :logout
  get 'login' => 'sessions#new', as: :login
end
