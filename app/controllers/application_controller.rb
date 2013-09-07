class ApplicationController < ActionController::Base
  before_filter :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) do |u|
        u.permit :display_name, :email, :password, :password_confirmation, :avatar, :about
      end
      devise_parameter_sanitizer.for(:account_update) do |u|
        u.permit :display_name, :email, :password, :password_confirmation, :current_password, :avatar, :about
      end
    end
end
