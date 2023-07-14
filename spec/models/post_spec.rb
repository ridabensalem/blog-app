require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it 'has many comments ' do
      association = described_class.reflect_on_association(:comments)
      expect(association.macro).to eq(:has_many)
    end
    it 'has many likes ' do
      association = described_class.reflect_on_association(:likes)
      expect(association.macro).to eq(:has_many)
    end

    it 'belongs to author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
