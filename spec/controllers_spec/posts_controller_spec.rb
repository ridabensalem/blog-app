# spec/controllers/posts_controller_spec.rb
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index, params: { user_id: 1 }
      expect(response).to be_successful
    end
it "renders the index template" do
  get :index, params: { user_id: 1 }
  expect(response).to render_template("index")
end

  end

end
