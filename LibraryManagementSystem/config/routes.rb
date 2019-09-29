Rails.application.routes.draw do
  # resources :libraries
  resources :reservations
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :users
  resources :books
  resources :universities do
    resources :libraries do
      resources :lib_books, :reservations
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'universities#index'
end
