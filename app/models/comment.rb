class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :post

  validates :author_id, presence: true
  validates :post_id, presence: true
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that updates the comments counter for a post.
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
