class CommentsController < ApplicationController
  before_action :set_post

  def create
    @comment = @post.comments.new(comment_params)
    @comment.author = current_user

    if @comment.save
      @post.update_comments_counter
      redirect_to user_post_path(@post.author, @post), notice: 'Comment created successfully.'
    else
      redirect_to user_post_path(@post.author, @post), alert: 'Failed to create the comment.'
    end
  end

  def destroy
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    @post.update_comments_counter
    redirect_to user_post_path(@post.author, @post), notice: 'Comment deleted successfully.'
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
