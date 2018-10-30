# frozen_string_literal: true

class RecipePolicy < ApplicationPolicy
  def index?
    true
  end

  def update?
    owned?
  end

  def destroy?
    owned?
  end

  def new?
    user.present?
  end

  def show?
    record.public? ||
      user.present?
  end

  private
    def owned?
      record.account.id == user&.account&.id
    end
end
