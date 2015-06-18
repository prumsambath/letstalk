Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:edit, :update]

  resources :events do
    resources :event_registrations, except: [:edit, :update]
  end

  root to: "events#index"
end
