# frozen_string_literal: true

class Auth::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :check_enabled_registrations, only: [:new, :create]

  protected

    def build_resource(hash = nil)
      super(hash)

      resource.build_account if resource.account.nil?
    end

    def configure_sign_up_params
      devise_parameter_sanitizer.permit(:sign_up) do |u|
        u.permit({ account_attributes: [:username] }, :email, :password, :password_confirmation)
      end
    end

    def check_enabled_registrations
      redirect_to root_path if !allowed_registrations?
    end

    def allowed_registrations?
      ActiveModel::Type::Boolean.new.cast(ENV["OPEN_REGISTRATIONS"])
    end
end
