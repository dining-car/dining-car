# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit::Authorization

  protect_from_forgery

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  helper_method :current_account

  protected

    def current_account
      @current_account ||= current_user&.account
    end

    def pundit_user
      current_account
    end

  private

    def user_not_authorized
      flash[:alert] = "You are not authorized to perform this action."
      redirect_to(request.referrer || root_path)
    end
end
