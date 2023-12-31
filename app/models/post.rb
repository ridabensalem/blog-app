class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  after_save :increment_posts_counter

  validates :title, presence: true
  validates :title, length: { maximum: 250 }
  validates :likes_counter, numericality: { greater_than_or_equal_to: 0 }
  validates :comments_counter, numericality: { greater_than_or_equal_to: 0 }

  def increment_posts_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    comments.includes(:author).order(created_at: :desc).limit(5)
  end

  def update_comments_counter
    update(comments_counter: comments.count)
  end
end
