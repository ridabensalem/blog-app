# app/controllers/posts_controller.rb
class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show
    @recent_comments = @post.recent_comments
    @post = Post.find(params[:id])
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
