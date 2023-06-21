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
  
  resources :users, only: :show do
    member do
      scope module: :users do
        resources :chat_rooms, only: :index do
          member do
            resources :messages
          end
        end
      end
    end
  end
  
  resources :advisers, only: :show do
    member do
      scope module: :advisers do
        resources :chat_rooms, only: :index do
          member do
            resources :messages
          end
        end
      end
    end
  end
  
end
