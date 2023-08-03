FactoryBot.define do
  factory :post do
    sequence(:title) { |n| "Test Post #{n}" }
    text { 'This is a test post.' }
    likes_counter { 0 }
    comments_counter { 0 }

    # Assuming you also have associated factories defined for Author, Comment, and Like.
    after(:create) do |post|
      create_list(:comment, 5, post:, text: 'hi', author: nil)
    rescue StandardError
      ActiveRecord::RecordInvalid
    end
  end
end
