require 'rails_helper'

RSpec.describe 'Post index page', type: :feature do
  let(:user) { FactoryBot.create(:user) }
  let(:posts) { FactoryBot.create_list(:post, 3, author: user) } # Create 11 posts for pagination testing

  before do
    posts
    visit user_posts_path(user)
  end

  scenario 'I can see the user\'s profile picture' do
    expect(page).to have_css("img[src='#{user.photo}']") if user.photo.present?
  end

  scenario 'I can see the user\'s username' do
    expect(page).to have_content(user.name)
  end

  scenario 'I can see the number of posts the user has written' do
    expect(page).to have_content("Number of posts: #{user.posts_counter}")
  end

  scenario 'I can see a post\'s title' do
    expect(page).to have_content(posts.last.title) # Access the title of the last post in the list
  end

  scenario 'I can see some of the post\'s body' do
    expect(page).to have_content(posts.last.text[0..50]) # Access the text of the last post in the list
  end

  scenario 'I can see the first comments on a post' do
    first_post_comments = posts.first.comments
    expect(page).to have_content(first_post_comments.last.text) if first_post_comments.present?
  end

  scenario 'I can see how many comments a post has' do
    expect(page).to have_content("Comments: #{posts.last.comments.count}") # Use 'count' method to get the number of comments
  end

  scenario 'I can see how many likes a post has' do
    expect(page).to have_content("Likes: #{posts.last.likes_counter}")
  end

  scenario 'I can see a section for pagination if there are more posts than fit on the view' do
    # Ensure that the posts on the first page are displayed (3 posts)
    expect(page).to have_selector('.posts_list', count: 3, wait: 5)

    # Check if pagination controls are NOT present
    expect(page).not_to have_selector('.pagination', wait: 5)
  end

  scenario 'When I click on a post, it redirects me to that post\'s show page' do
    click_on posts.last.title # Click on the link of the last post in the list
    expect(current_path).to eq(user_post_path(user, posts.last))
  end
end
