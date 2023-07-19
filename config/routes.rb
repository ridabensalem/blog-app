# config/routes.rb
Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :posts, only: [ :index, :show] do
      resources :comments, only: [:create, :destroy]
    end
  end

  resources :posts, only: [:show] do
    resources :likes, only: [:create, :destroy]
  end
end
