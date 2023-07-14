# unit test for like model
require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it 'belongs to post' do
      association = described_class.reflect_on_association(:post)
      expect(association.macro).to eq(:belongs_to)
    end
    it 'belongs to author' do
      association = described_class.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
