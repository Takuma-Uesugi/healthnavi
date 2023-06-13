Rails.application.routes.draw do
  get 'advisers/show'
  root "tops#index"
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    passwords: "users/passwords",
    confirmations: "users/confirmations",
    sessions: "users/sessions"
  }
  
  devise_for :advisers, controllers: {
    registrations: "advisers/registrations",
    passwords: "advisers/passwords",
    confirmations: "advisers/confirmations",
    sessions: "advisers/sessions"
  }
  
  resources :users, only: :show
  resources :advisers, only: :show
end
