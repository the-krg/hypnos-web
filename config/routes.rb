Rails.application.routes.draw do
  resources :days
  resources :nights
  devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations' }

  devise_scope :user do
    unauthenticated :user do
      root to: 'users/sessions#new'
    end

    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end
  end

  get '/settings', to: 'dashboard#settings'
end
