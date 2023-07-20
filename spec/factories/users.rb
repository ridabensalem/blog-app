# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    # Add other attributes as needed
    posts_counter { 0 } # Setting the default value for posts_count
  end
end
