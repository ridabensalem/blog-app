FactoryBot.define do
  factory :comment do
    user_id { nil }
    text { 'hi' }
    author { nil }
    association :post
  end
end
