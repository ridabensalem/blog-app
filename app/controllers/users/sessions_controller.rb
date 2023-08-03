class Users::SessionsController < Devise::SessionsController
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: %i[email password])
  end
end
