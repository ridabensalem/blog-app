class AddCommentCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :comment_count, :integer
  end
end
