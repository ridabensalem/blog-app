require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many posts with correct foreign key' do
      association = described_class.reflect_on_association(:posts)
      expect(association.macro).to eq(:has_many)
      expect(association.options[:foreign_key]).to eq('author_id')
    end
  end

  describe 'validations' do
    it 'validates presence of name' do
      user = User.new
      user.valid?
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates numericality of posts_counter' do
      user = User.new
      user.valid?
      expect(user.errors[:posts_counter]).to include('is not a number')
    end
  end
end
