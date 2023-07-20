# spec/factories/posts.rb
FactoryBot.define do
  factory :post do
    # Define necessary attributes for the post
    title { Faker::Lorem.sentence }
    user
  end
end
