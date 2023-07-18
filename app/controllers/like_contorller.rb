# app/controllers/likes_controller.rb
class LikesController < ApplicationController
  before_action :set_post

  def create
    @like = @post.likes.new(like_params)
    if @like.save
      # Update likes counter for the post
      @post.update_likes_counter
      redirect_to @post, notice: 'Post liked successfully.'
    else
      redirect_to @post, alert: 'Failed to like the post.'
    end
  end

  def destroy
    @like = @post.likes.find(params[:id])
    @like.destroy
    # Update likes counter for the post
    @post.update_likes_counter
    redirect_to @post, notice: 'Post unliked successfully.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def like_params
    params.require(:like).permit(:author_id)
  end
end
