# spec/requests/users_spec.rb
require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'checks if it is responding' do
      get users_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /users/:id' do
    let(:user) { FactoryBot.create(:user) }
    it 'should return a serialized user' do
      get user_path(user)
      expect(response).to have_http_status(200)
    end
  end
end
