class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.new(author: current_user)

    if @like.save
      @post.update_likes_counter
      redirect_to user_post_path(@post.author, @post), notice: 'Post liked successfully.'
    else
      redirect_to user_post_path(@post.author, @post), alert: 'Failed to like the post.'
    end
  end

  def destroy
    @like = @post.likes.find(params[:id])
    @like.destroy
    @post.update_likes_counter
    redirect_to user_post_path(@post.author, @post), notice: 'Post unliked successfully.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end
end
