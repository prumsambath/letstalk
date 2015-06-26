Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:edit, :update] do
    resources :events
  end

  resources :events do
    resources :event_registrations, only: [:create, :destroy]
  end

  root to: "events#index"
end
