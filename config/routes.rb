Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:edit, :update] do
    resources :events
  end

  root to: "events#index"
end
