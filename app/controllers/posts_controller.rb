class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end
end
