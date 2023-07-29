Rails.application.routes.draw do
  root "users#index"
  
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show, :new, :create, :destroy] do
      resources :comments, only: [:create, :new, :destroy] # Add 'new' action for comments
      resources :likes, only: [:create], on: :member
    end
    get 'posts/new', to: 'posts#new', as: :new_user_post # Required route for the new action
  end
end
