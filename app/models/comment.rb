class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', optional: true
  belongs_to :post, counter_cache: true

  # validates :author_id, presence: false
  # validates :post_id, presence: true
  # validates :text, presence: true

  # A method that updates the comments counter for a post.
  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
