
Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root to: "users#index"

  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:create, :new]
      resources :likes, only: [:create]
    end
  end
end