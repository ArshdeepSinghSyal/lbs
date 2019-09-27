Rails.application.routes.draw do

  resources :reservations
  resources :lib_books
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :books
  resources :libraries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
end
