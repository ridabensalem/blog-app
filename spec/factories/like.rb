# spec/factories/likes.rb

FactoryBot.define do
  factory :like do
    association :author, factory: :user # Assuming you have a factory named :user for the author
    association :post

    # You can add other attributes as needed
    # For example:
    # additional_attribute { 'value' }

    # If you want to avoid running the `update_likes_counter` method during testing, you can add `transient` attributes
    transient do
      skip_update_likes_counter { false }
    end

    after(:create) do |like, evaluator|
      like.update_likes_counter unless evaluator.skip_update_likes_counter
    end
  end
end
