Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }

  devise_scope :user do
    unauthenticated :user do
      root to: 'users/sessions#new'
    end

    authenticated :user do
      root to: 'dashboard#index', as: :authenticated_root
    end
  end
end
