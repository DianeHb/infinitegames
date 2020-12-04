Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :library_games, only: [:index, :show, :create] do
    collection do
      get :lent
    end
    member do
      patch :lend
    end
    resources :game_sessions, only: [:index, :create]
  end

  resource :search, only: [:show]

  resources :games, only: [:index, :show] do
    resources :reviews, only: [:create]
  end

  resources :friends, only: [:index, :create]
end
