class RegistrationsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(registration_params)

    if @user.save
      redirect_to root_path, notice: 'Registration successful'
    else
      render :new
    end
  end

  def registration_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
