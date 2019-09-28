Rails.application.routes.draw do
  resources :reservations
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :books
  resources :libraries do
    resources :lib_books
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
end
