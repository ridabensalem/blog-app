class RegistrationsController < ApplicationController
  def create
    @user = User.new(user_params)
    if @user.save
      puts 'User created successfully'
    else
      puts 'User not created'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
# auto fix stylelint errors 
