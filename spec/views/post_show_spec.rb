require 'rails_helper'

RSpec.describe 'Post show page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:post) { FactoryBot.create(:post, author: user) }
  let!(:comments) { FactoryBot.create_list(:comment, 3, post:, author: user) }

  before do
    post.update(likes_counter: 5) # Set the initial number of likes
    visit user_post_path(post.author, post)
  end

  it 'I can see the post\'s title' do
    expect(page).to have_content(post.title)
  end

  it 'I can see who wrote the post' do
    expect(page).to have_content(post.author.name)
  end

  it 'I can see how many comments it has' do
    expect(page).to have_content("Comments: #{post.comments.count}")
  end

  it 'I can see how many likes it has' do
    expect(page).to have_content("Likes: #{post.likes_counter}")
  end

  it 'I can see the post body' do
    expect(page).to have_content(post.text)
  end

  it 'I can see the username of each commenter' do
    comments.each do |comment|
      expect(page).to have_content(comment.author.name)
    end
  end

  it 'I can see the comment each commenter left' do
    comments.each do |comment|
      expect(page).to have_content(comment.text)
    end
  end
end
