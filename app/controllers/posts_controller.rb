class PostsController < ApplicationController
  def new
    @user = User.find(params[:user_id])
    @post = @user.posts.build
  end

  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.build(post_params)

    if @post.save
      redirect_to user_posts_path(@user), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments, :likes)
    @post = Post.new
  end

  def show
    @user = User.find(params[:user_id])
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
