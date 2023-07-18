# config/routes.rb
Rails.application.routes.draw do
  # List all posts for a given user
  get '/users/:user_id/posts', to: 'posts#index', as: :user_posts

  # Show a specific post
  get '/posts/:id', to: 'posts#show', as: :post

  # Create a new comment for a specific post
  get '/posts/:post_id/comments/new', to: 'comments#new', as: :new_comment
  post '/posts/:post_id/comments', to: 'comments#create', as: :comments
end
