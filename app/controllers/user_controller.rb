# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :set_user, only: [:show]

  def index
    @users = User.all
  end

  def show
    @recent_posts = @user.recent_posts
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
