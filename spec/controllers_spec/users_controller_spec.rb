RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'checks if it is responding' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'response body includes correct placeholder text' do
      get users_path
      expect(response.body).to include('Hello, this is the index page!')
    end
  end

  describe 'GET /users/:id' do
    let(:user) { FactoryBot.create(:user) }

    it 'should return a serialized user' do
      get user_path(user)
      expect(response).to have_http_status(200)
    end

    it 'renders the correct template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'response body includes correct placeholder text' do
      get user_path(user)
      expect(response.body).to include('User Profile')
      expect(response.body).to include("Name: #{user.name}")
      expect(response.body).to include("Total Posts: #{user.posts.count}")
    end
  end
end
