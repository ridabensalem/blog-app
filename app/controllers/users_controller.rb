class UsersController < ApplicationController
  def index
    @users = User.includes(:posts).order('created_at DESC')
  end

  def show
    @user = User.includes(posts: :comments).find_by(id: params[:id])
  end
  def list_posts
    @user = User.find_by(id: params[:id])
    if @user
      @posts = @user.posts.order(created_at: :desc)
      render json: { user: @user, posts: @posts }
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end
end
