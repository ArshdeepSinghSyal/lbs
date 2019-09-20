Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :librarians
  resources :admins
  resources :books
  resources :students
  resources :libraries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
end
