Rails.application.routes.draw do
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
  
  resources :users do
    resources :chat_rooms, controller: 'users/chat_rooms' do
      resources :messages, controller: 'users/chat_rooms/messages'
    end
  end
  
  resources :advisers, only: :show do
    resources :chat_rooms, controller: 'advisers/chat_rooms' do
      resources :messages, controller: 'advisers/chat_rooms/messages'
    end
  end
  
end
