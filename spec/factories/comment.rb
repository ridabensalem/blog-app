FactoryBot.define do
  factory :comment do
    text { 'hi' }
    association :author, factory: :user
    association :post
  end
end
