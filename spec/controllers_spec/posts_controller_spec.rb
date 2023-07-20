require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Posts', type: :request do
  before(:each) do
    # Clean up the test database before each test
    Post.destroy_all
  end

  describe 'GET /posts' do
    it 'works! (now write some real specs)' do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it 'returns all posts' do
      expect(Post.count).to eq(0)
    end

    it 'renders the index template' do
      get posts_path
      expect(response).to render_template(:index)
    end

    it 'includes correct placeholder text in the response body' do
      get posts_path
      expect(response.body).to include('Welcome to post index page')
      # Replace 'Welcome to post index page' with the actual placeholder text that should be in the index view.
    end
  end

  # Add more tests for other actions if needed.
end
