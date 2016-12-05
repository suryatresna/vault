module Vault
  class AuthController < Devise::SessionsController
    layout "login"
    before_action :configure_sign_in_params

    # signin
    # def index
    # 	super
    # end

    # # post signin
    # def create
    #   super
    # end

    # # logout
    # def destroy
    #   super
    # end


    # If you have extra params to permit, append them to the sanitizer.
    def configure_sign_in_params
      devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
    end
  end
end
