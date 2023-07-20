# spec/factories/comments.rb
FactoryBot.define do
  factory :comment do
    sequence(:text) { |n| "Comment #{n}" }
    association :post
  end
end
