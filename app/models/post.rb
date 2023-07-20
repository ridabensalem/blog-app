class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  has_many :comments
  has_many :likes

  validates :author_id, presence: true, allow_blank: true
  validates :title, presence: true, length: { maximum: 250 }
  validates :text, presence: true
  validates :comments_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :likes_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # A method that updates the posts counter for a user.
  def update_posts_counter
    update(posts_counter: posts.count)
  end

  # A method that returns the 5 most recent comments for a given post.
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
