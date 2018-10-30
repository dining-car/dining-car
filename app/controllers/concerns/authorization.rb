# frozen_string_literal: true

module Authorization
  extend ActiveSupport::Concern

  include Pundit

  def pundit_user
    current_account
  end
end
