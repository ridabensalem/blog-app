# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Test Post #{n}" }
    text { 'This is a test post.' }
    comment_count { 0 } # Set default value for comments_count
    likes_counter { 0 } # Set default value for likes_count

    # Assuming you also have associated factories defined for Author, Comment, and Like.
    after(:create) { |post| create_list(:comment, 3, post: post) }
    after(:create) { |post| create_list(:like, 5, post: post) }
  end
end
