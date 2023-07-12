class Post < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :comments

  validates :author_id, presence: true
  validates :title, presence: true
  validates :text, presence: true
  # A method that updates the posts counter for a user.
  def update_posts_counter
    update(posts_counter: posts.count)
  end

  # A method that returns the 5 most recent posts for a given post.
  def recent_comments(limit = 5)
    comments.order(created_at: :desc).limit(limit)
  end
end
