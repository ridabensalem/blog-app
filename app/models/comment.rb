class Comment < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  validates :author_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true
  #  A method that updates the comments counter for a post.
  def update_comments_counter
    update(comments_counter: comments.count)
  end
end
