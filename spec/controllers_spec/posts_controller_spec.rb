require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Posts', type: :request do
  before(:each) do
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
    end
  end
  describe 'GET /posts/:id' do
    let(:post) { FactoryBot.create(:post) }

    it 'should return a serialized post' do
      get post_path(post)
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get post_path(post)
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      get post_path(post)
      expect(response.body).to include('Post Details') && include('Author: ')
      expect(response.body).to include(post.title) && include(post.text)
    end
  end
end
