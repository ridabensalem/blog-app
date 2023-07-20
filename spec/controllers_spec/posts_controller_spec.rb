require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    it 'works! (now write some real specs)' do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it 'returns all posts' do
      expect(Post.count).to eq(0)
    end
  end
end
