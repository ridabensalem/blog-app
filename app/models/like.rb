class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  belongs_to :post

  validates :author_id, presence: true
  validates :post_id, presence: true

  # A method that updates the likes counter for a post.
  def update_likes_counter
    update(likes_counter: likes.count)
  end
end
