# app/controllers/comments_controller.rb
class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    if @comment.save
      # Update comments counter for the post
      @post.update_comments_counter
      redirect_to @post, notice: 'Comment created successfully.'
    else
      redirect_to @post, alert: 'Failed to create the comment.'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    # Update comments counter for the post
    @post.update_comments_counter
    redirect_to @post, notice: 'Comment deleted successfully.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:author_id, :text)
  end
end
